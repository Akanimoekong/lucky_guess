// import 'dart:math';

// import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lucky_guess/splashscreen.dart';

void main() {
  // Stop rotation to landscape
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  // Initialize admob
  MobileAds.instance.initialize();

  return runApp(
    MaterialApp(home: MySplashScreen()),
  );
}
