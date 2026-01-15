import 'package:supabase_flutter/supabase_flutter.dart';

class CoupleService {
  final supabase = Supabase.instance.client;

  /// CREATE COUPLE
  Future<String> createCouple(String code) async {
    final userId = supabase.auth.currentUser!.id;

    final res = await supabase
        .from('couples')
        .insert({
      'code': code,
      'user1': userId,
    })
        .select()
        .single();

    // Update profile
    await supabase
        .from('profiles')
        .update({'couple_id': res['id']})
        .eq('id', userId);

    return code;
  }

  /// JOIN COUPLE
  Future<void> joinCouple(String code) async {
    final userId = supabase.auth.currentUser!.id;

    final couple = await supabase
        .from('couples')
        .select()
        .eq('code', code)
        .single();

    if (couple['user2'] != null) {
      throw "This couple is already full 💔";
    }

    // Update couple
    await supabase
        .from('couples')
        .update({'user2': userId})
        .eq('id', couple['id']);

    // Update profile
    await supabase
        .from('profiles')
        .update({'couple_id': couple['id']})
        .eq('id', userId);
  }
}
