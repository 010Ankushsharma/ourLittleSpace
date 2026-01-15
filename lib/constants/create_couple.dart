import 'package:supabase_flutter/supabase_flutter.dart';

import 'generate_code.dart';

Future<void> createCouple() async {
  final code = generateCode();

  await Supabase.instance.client
      .from('couples')
      .insert({
    'code': code,
  });
}
