import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> joinCouple(String code) async {
  final supabase = Supabase.instance.client;

  final couple = await supabase
      .from('couples')
      .select()
      .eq('code', code)
      .single();

  if (couple['user2'] != null) {
    throw 'Couple already connected';
  }

  await supabase
      .from('couples')
      .update({'user2': supabase.auth.currentUser!.id})
      .eq('id', couple['id']);
}
