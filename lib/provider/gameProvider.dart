import 'dart:async';

import 'package:flutter/material.dart';

import '../models/gameModel.dart';

class GameProvider extends ChangeNotifier{
  // wer define  a timer
  Timer? ttimer;
  int seconds = 0;
  int minutes = 0;
  int hours = 0;
  int counter = 40;
  String? countdown="0";

  int correctAnswerCounter=0;

  // void startTimer_fortime() {
  //   const oneSec = const Duration(seconds: 1);
  //
  //   _timer = new Timer.periodic(
  //     oneSec,
  //         (Timer timer) {
  //
  //             () {
  //           if (seconds < 0) {
  //             timer.cancel();
  //           } else {
  //             seconds = seconds + 1;
  //             if (seconds > 59) {
  //               minutes += 1;
  //               seconds = 0;
  //               if (minutes > 59) {
  //                 hours += 1;
  //                 minutes = 0;
  //               }
  //             }
  //             countdown = "$hours : $minutes : $seconds";
  //             print("$seconds : $minutes : $hours");
  //           }
  //
  //
  //     };},
  //   );
  // }

  void coundown2() {
Future.delayed(Duration( seconds: 3),() {
  ttimer = Timer.periodic(Duration(seconds: 1), (timer) {
    if(counter>0){

      counter-=1;
      countdown=counter.toString();
      notifyListeners();

      // counter=counter-1;

    }else{
      timer.cancel();
    }

  });
  // it notifies every widget of the changes depending on that variable
  notifyListeners();
},);


  }

  //


  // lets declare a list of the instance of gameModel
  List<GameModel> ListGameModel = [
    GameModel(
        image: "asset/alvan-nee-ZCHj_2lJP00-unsplash.jpg",
        answerA: "Bombei",
        answerB: "Cat",
        answerC: "Dog",
        answerD: "Ewu",
        correctAnswer: "Cat"),
    GameModel(
        image: "asset/gunie.jpg",
        answerA: "Rat",
        answerB: "Rabbit",
        answerC: "Oke",
        answerD: "Guinea Pig",
        correctAnswer: "Guinea Pig"),
    GameModel(
        image: "asset/charlesdeluvio-Mv9hjnEUHR4-unsplash.jpg",
        answerA: "Dog",
        answerB: "Pitbu",
        answerC: "Bull",
        answerD: "Pig",
        correctAnswer: "Dog"),
    GameModel(
        image: "asset/josh-berquist-_4sWbzH5fp8-unsplash.jpg",
        answerA: "BVN",
        answerB: "BMW",
        answerC: "BWW",
        answerD: "IVM",
        correctAnswer: "BMW")
  ];

//   let me create a correct answer increaser



  void correctAnswerIncreaser(){
    correctAnswerCounter+=1;
    notifyListeners();

  }



}