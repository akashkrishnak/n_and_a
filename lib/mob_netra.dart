import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:lottie/lottie.dart';
import 'main.dart';

class mob_netra extends StatefulWidget {
  const mob_netra({super.key});

  @override
  State<mob_netra> createState() => _mob_netraState();
}

final _imagePicker = ImagePicker();
XFile? image;
FirebaseStorage storage = FirebaseStorage.instance;

class _mob_netraState extends State<mob_netra> {
  @override
  getimage() async {
    if (kIsWeb) {
      image = (await _imagePicker.pickImage(source: ImageSource.camera));
      await storage.ref().child('image/Netra/').putData(
          await image!.readAsBytes(),
          SettableMetadata(contentType: 'image/jpeg'));
      MyAppState.imageUrl =
          await storage.ref().child('image/Netra/').getDownloadURL();
    }
  }

  @override
  void geturl() async {
    MyAppState.imageUrl =
        await storage.ref().child('image/Netra/').getDownloadURL();
    if (MyAppState.imageUrl != "") {
      MyAppState.hasphoto = true;
    } else {
      MyAppState.hasphoto = false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      geturl();
    });
    print("test ${MyAppState.imageUrl}");
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("N E T R A 'S   D O M A I N"),
          ),
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.3,
                      backgroundColor: Colors.grey[50],
                      child: MyAppState.imageUrl != "" && MyAppState.hasphoto
                          ? Image.network('${MyAppState.imageUrl}')
                          : Lottie.asset('assets/unicorn.zip')),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          padding: EdgeInsets.only(top: 10),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: ElevatedButton(
                              onPressed: () async {
                                await getimage();
                                MyAppState.hasphoto = true;
                              },
                              child: Text(
                                "Take Photo!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05),
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.black)),
                            ),
                          )),
                      Container(
                          padding: EdgeInsets.only(top: 10),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: ElevatedButton(
                              onPressed: () {
                                final deleteref =
                                    storage.ref().child('image/Netra');
                                deleteref.delete();
                                MyAppState.hasphoto = false;
                              },
                              child: Text(
                                "Delete Photo!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05),
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.black)),
                            ),
                          )),
                    ],
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Hero(
                            tag: "woman",
                            child: Image.asset('assets/woman.png'),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
