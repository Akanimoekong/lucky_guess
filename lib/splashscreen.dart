import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lucky_guess/luckdice.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);
  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => GuessPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // AssetImage(assetName)
              Image.asset(
                'images/diceapp.gif',
                height: 150,
              ),
              SizedBox(
                height: 100,
              ),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              )
            ],
          )

              //   SplashScreen(
              //   seconds: 3,
              //   navigateAfterSeconds: GuessPage(),
              //   backgroundColor: Colors.blue.shade900,
              //   title: Text('Lucky Guess'),
              //   image: Image.asset('images/diceapp.gif'),
              //   photoSize: 100.0,
              // ),
              ),
        ),
      ),
    );
  }
}
