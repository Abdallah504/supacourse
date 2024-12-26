import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabasecourse/logic/main-app-provider.dart';
import 'package:supabasecourse/screens/profile-screen.dart';
import 'package:supabasecourse/screens/register-screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<MainAppProvider>(
        builder: (context ,provider,_){
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text('Login Page',style: TextStyle(color: Colors.white),),
            ),
            body: Center(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          hintText: 'Email'
                      ),
                    ),
                    TextField(
                      controller: passController,
                      decoration: InputDecoration(
                          hintText: 'Password'
                      ),
                    ),
                    ElevatedButton(onPressed: (){
                      provider.signInWithSupabase(email: emailController.text, password: passController.text).then((v){
                        provider.getUserData();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
                      });
                    }, child: Text('Login',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),

                    Row(
                      children: [
                        Text('New here ?!',style: TextStyle(color: Colors.black),),
                        TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>RegScreen()));
                        }, child: Text('Register',style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold),))
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
