import 'package:supabase_flutter/supabase_flutter.dart';

class ConnectionService {
  final supabase = Supabase.instance.client;

  /// Check if user is connected & fetch partner name
  Future<Map<String, dynamic>> getConnectionStatus() async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      return {'connected': false};
    }

    // get profile
    final profile = await supabase
        .from('profiles')
        .select()
        .eq('id', user.id)
        .single();

    final coupleId = profile['couple_id'];

    if (coupleId == null) {
      return {'connected': false};
    }

    // get couple
    final couple = await supabase
        .from('couples')
        .select()
        .eq('id', coupleId)
        .single();

    final partnerId =
    couple['user1'] == user.id ? couple['user2'] : couple['user1'];

    if (partnerId == null) {
      return {'connected': false};
    }

    // get partner profile
    final partner = await supabase
        .from('profiles')
        .select('name')
        .eq('id', partnerId)
        .single();

    return {
      'connected': true,
      'partnerName': partner['name'],
    };
  }
}
