import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rest_api_test/screens/home_screeen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    startSplashScreenTimer();
  }

  startSplashScreenTimer() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, navigationToNextPage);
  }

  void navigationToNextPage() async {
    Navigator.pushAndRemoveUntil(
      context,
      new MaterialPageRoute(builder: (context) => new HomeScreen()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 32, 110, 183),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 100,
              ),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(40.0)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image(
                  image: AssetImage('images/splash_screen.jpg'),
                  height: 200.0,
                  width: 200.0,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              CircularProgressIndicator(
                backgroundColor: Color.fromARGB(255, 32, 110, 183),
              ),
              Container(
                  padding: EdgeInsets.only(top: 20, bottom: 50),
                  child: Text(
                    'مرحبا بكم',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ))
            ]),
      ),
    );
  }
}
