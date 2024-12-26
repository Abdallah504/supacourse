import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabasecourse/logic/main-app-provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainAppProvider>(
        builder: (context ,provider,_){
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text('Profile Screen'),
              actions: [
                IconButton(onPressed: provider.signOutWithSupabase, icon: Icon(Icons.exit_to_app))
              ],
            ),
            body: Center(child: Text(provider.userEmail.toString()),),
          );
        });
  }
}
