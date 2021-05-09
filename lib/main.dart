import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:s2_calculator/home.dart';

void main() =>
    runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen()
      ), // Wrap your app
      // ),
    );

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    checktimer();
  }

  checktimer() async {
        new Future.delayed(
            const Duration(seconds: 5),
                () =>
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                )
        );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedSize(
                vsync: this,
                duration: Duration(milliseconds: 2000),
                curve: Curves.bounceInOut,
                child: Image(
                    image: AssetImage("assets/logo.png"), height: 250)),
            AnimatedSize(
              vsync: this,
              duration: Duration(milliseconds: 2000),
              curve: Curves.elasticOut,
              child: Container(
                height: 40,
                child: Center(
                  child: Text(
                    "Ahad Shamim\nSP17-BCS-030",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                ),
              ),
            )
          ],
        ),
      ), //<- place where the image appears
    );
  }
}
