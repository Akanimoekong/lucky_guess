// import 'dart:math';

// import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'luckdice.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Lucky Guess'),
          backgroundColor: Colors.blue,
        ),
        body: const GuessPage(),
      ),
    ),
  );
}
