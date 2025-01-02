import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabasecourse/screens/login-screen.dart';
import 'package:supabasecourse/screens/note-screen.dart';
import 'package:supabasecourse/screens/profile-screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Supabase.instance.client.auth.onAuthStateChange,
        builder: (context ,snapshot){
          // Build page based on auth state
          if(snapshot.connectionState == ConnectionState.waiting){
            return Scaffold(
              backgroundColor: Colors.white,
              body: Center(child: CircularProgressIndicator(color: Colors.black,),),
            );
          }

          final session = snapshot.hasData ? snapshot.data!.session : null;

          if(session !=null){
            return NoteScreen();
          }else{
            return LoginScreen();
          }
        });
  }
}
