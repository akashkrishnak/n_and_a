import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'home.dart';
import 'package:firebase_storage/firebase_storage.dart';

void main() async {
// Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

FirebaseStorage storage = FirebaseStorage.instance;

class MyAppState extends State<MyApp> {
  static String imageUrl = "";
  static String imageUrl2 = "";
  static bool hasphoto = false;
  static bool hasphoto2 = false;
  @override
  void geturl() async {
    imageUrl = await storage.ref().child('image/Netra/').getDownloadURL();
    if (imageUrl != "") {
      hasphoto = true;
    } else {
      hasphoto = false;
    }
    imageUrl2 = await storage.ref().child('image/Akash/').getDownloadURL();
    if (imageUrl2 != "") {
      hasphoto2 = true;
    } else {
      hasphoto2 = false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      geturl();
    });
    print(imageUrl);
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
