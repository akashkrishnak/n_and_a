import 'package:flutter/material.dart';
import 'package:n_and_a/akash.dart';
import 'netra.dart';
import 'akash.dart';

class desktop extends StatefulWidget {
  const desktop({super.key});

  @override
  State<desktop> createState() => _desktopState();
}

class _desktopState extends State<desktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: Hero(
                  tag: "woman",
                  child:Image.asset('assets/woman.png'),
                )
              ),
              Text(
                'N E T R A',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.03),
              )
            ],
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const netra()),
            );
          },
        ),
        GestureDetector(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: Hero(
                  tag: "man",
                  child:Image.asset('assets/delivery-boy.png'),
                )
              ),
              Text(
                'A K A S H',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.03),
              )
            ],
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const akash()),
            );
          },
        )
      ],
    ));
  }
}
