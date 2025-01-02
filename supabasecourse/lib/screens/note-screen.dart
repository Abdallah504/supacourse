import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabasecourse/logic/storage-provider.dart';
import 'package:supabasecourse/model/note-model.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {

  TextEditingController noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<StorageProvider>(
      
      builder: (context , provider, _){
        return Scaffold(
          floatingActionButton: FloatingActionButton(onPressed: (){
            showDialog(context: context,
                       builder: (context){
                        return AlertDialog(
                          title: Text('Add Note'),
                          content: TextField(
                            controller: noteController,
                            
                          ),
                          actions: [
                            TextButton(onPressed: (){
                              final newNote = Note(content: noteController.text);

                              provider.createNote(newNote);
                              Navigator.pop(context);
                              noteController.clear();
                            }, child: Text('Add'))
                          ],
                        );
                       });
          },child: Icon(Icons.add),),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Noite App',style: TextStyle(color: Colors.white),),
      ),
      body: StreamBuilder(
        
        stream: provider.stream,
        builder: (context, snapshot){
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(color: Colors.red,),
            );
          }
          final notes = snapshot.data!;

          return ListView.builder(
            itemCount: notes.length,
            shrinkWrap: true,
            
            itemBuilder: (context,index){
              return ListTile(
                title: Text(notes[index].content.toString()),
                trailing: 
                Container(
                  width: 110,
                  child: Row(
                    children: [
                      IconButton(onPressed: (){
                        provider.deleteNote(notes[index]);
                      }, icon: Icon(Icons.delete,color: Colors.red,)),
                      SizedBox(width: 5,),
                      IconButton(onPressed: (){
                        showDialog(context: context,
                         builder: (context){
                          return AlertDialog(
                            title: Text('Update Note'),
                            content: TextField(
                              controller: noteController,
                              
                            ),
                            actions: [
                              TextButton(onPressed: (){
                                provider.updateNote(notes[index], noteController.text);
                                Navigator.pop(context);
                                noteController.clear();
                              }, child: Text('Update'))
                            ],
                          );
                         });
                      }, icon: Icon(Icons.edit,color: Colors.blue,))
                    ],),
                ),
              );
            });
        },),
      
    );
      });
  }
}