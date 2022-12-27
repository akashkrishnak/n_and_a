import 'package:flutter/material.dart';
import 'package:n_and_a/mobile.dart';
import 'desktop.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('N E T R A   A N D   A K A S H'),
        ),
        backgroundColor: Colors.black,
      ),
      body: LayoutBuilder(builder: (context,constraints){
        if(constraints.maxWidth<500)
        {
          return mobile();
        }
        else
        {
          return desktop();
        }
      })
    );
  }
}