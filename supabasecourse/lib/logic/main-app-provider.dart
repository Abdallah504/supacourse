import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MainAppProvider extends ChangeNotifier{
final SupabaseClient _supabaseClient = Supabase.instance.client;

String? userEmail;

Future<AuthResponse>signInWithSupabase({required String email, required String password})async{
  return await _supabaseClient.auth.signInWithPassword(password: password, email: email);
}

Future<AuthResponse>signUpWithSupabase({required String email, required String password})async{
  return await _supabaseClient.auth.signUp(password: password,email: email);
}

Future<void>signOutWithSupabase()async{
  await _supabaseClient.auth.signOut();
}

getUserData(){
  final session = _supabaseClient.auth.currentSession;
  final user = session?.user.email;
  userEmail = user;
}

}