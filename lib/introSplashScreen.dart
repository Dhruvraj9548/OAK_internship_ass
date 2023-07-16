import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oak_internship_ass/main.dart';

class introSplashScreen extends StatefulWidget{

  @override
  State<introSplashScreen> createState() => _introSplashScreen();
}

class _introSplashScreen extends State<introSplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WalkthroughScreen(),));
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        color: Colors.deepPurple,
        child: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.asset('assets/png files/Logo.png', height: 141.55, width: 124.62,),
            Image.asset('assets/png files/TAGLINE.png', height: 63, width: 230,)


          ],)
        )
      ),
    );
  }}