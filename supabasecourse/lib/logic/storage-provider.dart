import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabasecourse/model/note-model.dart';

class StorageProvider extends ChangeNotifier{
  File? imagefile;
  final ImagePicker picker = ImagePicker();
  final database = Supabase.instance.client.from('notes');
  // upload image

Future<void>pickImage() async{
final XFile? image = await picker.pickImage(source: ImageSource.gallery);
if(image !=null){
  imagefile = File(image.path);
  notifyListeners();
}
notifyListeners();
}

Future<void>uploadImage(context)async{
  if(imagefile !=null){
    final fileName = DateTime.now().millisecondsSinceEpoch.toString();
    final path = 'uploads/$fileName';
    await Supabase.instance.client.storage
    .from('images')
    .upload(path, imagefile!)
    .then((v){
      var snack = const SnackBar(content: Text('Image Uploaded'));
      ScaffoldMessenger.of(context).showSnackBar(snack);
    });
  }
}

////////////////////////////
//create note



Future createNote(Note newNote)async{
  await database.insert(newNote.toMap());
}

// read

final stream  = Supabase.instance.client.from('notes').stream(primaryKey: ['id']).map(
  (data)=>data.map((noteMap)=> Note.fromMap(noteMap)).toList()
);


// update

Future updateNote(Note oldNote, String newContent)async{
  await database.update({'content':newContent}).eq('id', oldNote.id!);
}


//delete

Future deleteNote(Note note)async{
  await database.delete().eq('id', note.id!);
}


}