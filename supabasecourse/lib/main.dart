import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabasecourse/logic/main-app-provider.dart';
import 'package:supabasecourse/screens/auth-gate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://njrjubuyxxalvfxtkudz.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5qcmp1YnV5eHhhbHZmeHRrdWR6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzI4MzA0OTMsImV4cCI6MjA0ODQwNjQ5M30.wvJHKV2p9VxA2lpuDf8gQQtxC0s9PUZ9GpQHD831Jp8',
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers:[
      ChangeNotifierProvider(create: (context)=>MainAppProvider())
    ] ,
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AuthGate(),
    ),
    );
  }
}

