import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../logic/main-app-provider.dart';

class RegScreen extends StatefulWidget {
  const RegScreen({super.key});

  @override
  State<RegScreen> createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
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
              title: Text('Register Page',style: TextStyle(color: Colors.white),),
            ),
            body: Center(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal:20),
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
                      provider.signUpWithSupabase(email: emailController.text, password: passController.text).then((v){
                        provider.getUserData();
                      });
                    }, child: Text('Register',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),))
                  ],
                ),
              ),
            ),
          );
        });
  }
}
