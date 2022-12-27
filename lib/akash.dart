import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class akash extends StatefulWidget {
  const akash({super.key});

  @override
  State<akash> createState() => _akashState();
}

class _akashState extends State<akash> {
  File? image;
  Future pickimage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    final imageTemporary = File(image.path);
    this.image = imageTemporary;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("A K A S H 'S   D O M A I N"),
          ),
          backgroundColor: Colors.black,
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Hero(
                        tag: "man",
                        child: Image.asset('assets/delivery-boy.png'),
                      )),
                ),
              ],
            ),
            Container(
                child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.1,
              child: ElevatedButton(
                onPressed: () {
                  pickimage();
                },
                child: Text(
                  "Take Photo!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.015),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black)),
              ),
            )),
          ],
        ));
  }
}
