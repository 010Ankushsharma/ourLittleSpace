import 'package:flutter/material.dart';
import 'package:foryou/constants/supabase_data.dart';
import 'package:foryou/pages/start_page.dart';
import 'package:foryou/pages/login_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: SupabaseData.supabaseUrl,
    anonKey:SupabaseData.anonKey,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(), // ✅ Scaffold goes INSIDE pages
    );
  }
}
