import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'main.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class mob_akash extends StatefulWidget {
  const mob_akash({super.key});

  @override
  State<mob_akash> createState() => _mob_akashState();
}

final _imagePicker = ImagePicker();
XFile? image;
FirebaseStorage storage = FirebaseStorage.instance;

class _mob_akashState extends State<mob_akash> {
  @override
  getimage() async {
    if (kIsWeb) {
      image = (await _imagePicker!.pickImage(source: ImageSource.camera));
      await storage.ref().child('image/Akash/').putData(
          await image!.readAsBytes(),
          SettableMetadata(contentType: 'image/jpeg'));
      MyAppState.imageUrl2 =
          await storage.ref().child('image/Akash/').getDownloadURL();
    }
  }

  @override
  void geturl() async {
    MyAppState.imageUrl2 =
        await storage.ref().child('image/Akash/').getDownloadURL();
    if (MyAppState.imageUrl2 != "") {
      MyAppState.hasphoto2 = true;
    } else {
      MyAppState.hasphoto2 = false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      geturl();
    });
    print("test ${MyAppState.imageUrl2}");
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("A K A S H 'S   D O M A I N"),
          ),
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                            tag: "man",
                            child: Image.asset('assets/delivery-boy.png'),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: ElevatedButton(
                              onPressed: () async {
                                await getimage();
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
                          padding: EdgeInsets.only(bottom: 10),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: ElevatedButton(
                              onPressed: () {
                                final deleteref =
                                    storage.ref().child('image/Akash');
                                deleteref.delete();
                                MyAppState.hasphoto2 = false;
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
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.grey[50],
                    radius: MediaQuery.of(context).size.width * 0.3,
                    child: MyAppState.imageUrl2 != "" && MyAppState.hasphoto2
                        ? Image.network('${MyAppState.imageUrl2}')
                        : Lottie.asset('assets/unicorn.zip'),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
