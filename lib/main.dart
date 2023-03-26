import 'package:driver/ui/views/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/model/fetch_data.dart';

Future<void> main() async{
  WidgetsFlutterBinding();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      messagingSenderId:"4029449304",
      appId:"1:4029449304:android:e47747b3003fe3f64ab62d",
      apiKey:"AIzaSyDEse0Z6wnb-5yrhydr3fH4kd9b0X97YKM",
      projectId: "walid-bf469",)
    
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Fetch()),
      ],
      child:
    MaterialApp(
      title: 'Driver',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    ));
  }
}
