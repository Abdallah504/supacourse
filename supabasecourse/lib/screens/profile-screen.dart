import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabasecourse/logic/main-app-provider.dart';
import 'package:supabasecourse/logic/storage-provider.dart';

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
          return Consumer<StorageProvider>(
              builder: (context , storage, _){
                return Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    title: Text('Profile Screen'),
                    actions: [
                      IconButton(onPressed: provider.signOutWithSupabase, icon: Icon(Icons.exit_to_app))
                    ],
                  ),
                  body: Center(
                    child: Column(
                      children: [
                        Text(provider.userEmail.toString()),
                        SizedBox(height: 20,),
                        storage.imagefile!=null?
                            Image.file(storage.imagefile!,height: 200,width: 200,)
                            :const Text('No Image Uploaded'),
                        SizedBox(height: 10,),

                        ElevatedButton(onPressed:storage.pickImage , child: Text('Pick Image')),
                        SizedBox(height: 10,),
                        ElevatedButton(onPressed:(){
                          storage.uploadImage(context);
                        } , child: Text('UploadImage'))
                      ],
                    ),
                  ),
                );
              });
        });
  }
}
