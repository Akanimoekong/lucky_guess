import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class GuessPage extends StatefulWidget {
  const GuessPage({Key? key}) : super(key: key);

  @override
  _GuessPageState createState() => _GuessPageState();
}

class _GuessPageState extends State<GuessPage> {
  int leftDice = 1;
  int rightDice = 1;
  String result = "2";
  late int outCome;
  String prediction = ' ';
  int buttonNumber = 2;

  final ButtonStyle style = ElevatedButton.styleFrom(
    primary: Colors.red,
    padding: const EdgeInsets.all(10),
    textStyle: const TextStyle(
      fontSize: 20,
    ),
  );
  // void toast() {
  //   Fluttertoast.showToast(
  //       msg: "JackPot",
  //       toastLength: Toast.LENGTH_LONG,
  //       gravity: ToastGravity.CENTER,
  //       timeInSecForIosWeb: 1,
  //       textColor: Colors.white,
  //       fontSize: 30.0);
  // }

  void changeDice() {
    // toast();
    setState(() {
      // or as a local variable
      AudioCache().play('shakedice.wav');

      // call this method when desired

      leftDice = Random().nextInt(6) + 1;
      rightDice = Random().nextInt(6) + 1;

      outCome = leftDice + rightDice;
      result = outCome.toString();

      if (outCome == buttonNumber) {
        if (outCome == 12) {
          AudioCache()..play('congratulations.mp3');
        } else {
          AudioCache()..play('congratulations.mp3');
        }
        print('Correct');
        AudioCache()..play('congratulations.mp3');
      } else {
        print('Wrong');
      }
    });
  }

  // Right dice building
  Expanded buildDiceRight() {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          setState(() {
            changeDice();
            // totalOutCome();
          });
        },
        child: Image.asset('images/dice$rightDice.png'),
      ),
    );
  }

  // Left dice building
  Expanded buildDiceLeft() {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          setState(() {
            changeDice();
          });
        },
        child: Image.asset('images/dice$leftDice.png'),
      ),
    );
  }

  Padding predictButton(buttonNumber) {
    // int myBut = buttonNumber;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
          style: style,
          onPressed: () {
            setState(() {
              this.buttonNumber = buttonNumber;
              // onClick(buttonNumber);
              int predict = buttonNumber;
              prediction = predict.toString();
              print('Shout out $buttonNumber');
            });
          },
          child: Text(buttonNumber.toString())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blue,
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  borderOnForeground: true,
                  margin: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 100.0,
                  ),
                  child: ListTile(
                    title: Center(
                      child: Text(
                        result,
                        style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                const Center(
                  child: Text(
                    'TOTAL OUTCOME',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                  width: 150.0,
                ),
                Center(
                  child: Container(
                    width: 250.0,
                    child: Row(
                      children: [
                        buildDiceLeft(),
                        buildDiceRight(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: Container(
                    // margin: const EdgeInsets.all(20),
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        prediction,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Wrap(
                    children: [
                      predictButton(
                        2,
                        //       (number){
                        // buttonNumber = number;}
                      ),
                      predictButton(3),
                      predictButton(4),
                      predictButton(5),
                      predictButton(6),
                      predictButton(7),
                      predictButton(8),
                      predictButton(9),
                      predictButton(10),
                      predictButton(11),
                      predictButton(12),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            padding: const EdgeInsets.all(10),
                            textStyle: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              changeDice();
                              // totalOutCome();
                              // diceSound();
                            });
                          },
                          child: const Text('R'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// End of Project
