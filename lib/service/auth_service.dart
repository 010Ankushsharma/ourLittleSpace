import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _client = Supabase.instance.client;

  Future<AuthResponse> signUp({
    required String email,
    required String password,
  }) async {
    return await _client.auth.signUp(
      email: email,
      password: password,
    );
  }

  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    return await _client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  User? get currentUser => _client.auth.currentUser;
  Future<void> ensureProfile() async {
    final user = Supabase.instance.client.auth.currentUser!;

    await Supabase.instance.client
        .from('profiles')
        .upsert({
      'id': user.id,
      'email': user.email,
    });
  }


}
