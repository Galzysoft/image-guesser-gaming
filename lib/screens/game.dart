import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imagegame/models/gameModel.dart';

import '../widgets/gameScreen.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  int index = 0;
  PageController controller = PageController(initialPage: 0);

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
   Timer? _timer;
  int seconds = 0;
  int minutes = 0;
  int hours = 0;
  int counter=40;
 late String countdown;
  void startTimer_fortime() {
    const oneSec = const Duration(seconds: 1);

    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
            setState(
            () {
          if (seconds < 0) {
            timer.cancel();
          } else {
            seconds = seconds + 1;
            if (seconds > 59) {
              minutes += 1;
              seconds = 0;
              if (minutes > 59) {
                hours += 1;
                minutes = 0;
              }
            }
            countdown="$hours : $minutes : $seconds";
            print("$seconds : $minutes : $hours");

          }
        },
      );
          },
    );


  }

  void countDown(){
  //   here lets define our duration of timing
    Duration _duration=Duration(seconds: 1);
  //  lets declare our timer
    _timer= new Timer.periodic(_duration, (timer) {
      if(counter>0){
        setState((){ counter=counter-1;
        countdown=counter.toString();});

      //   counter-=1;
      }else {timer.cancel();}
    });
  }
  @override
  dispose(){
    _timer?.cancel();
    super.dispose();
  }
  @override
  initState () {
    // this is for our hardcoded clock timing
    // startTimer_fortime();
    countDown();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            //this is the selfdefined method of creating  pages in pageview
            // child:PageView(children: [Center(child: Text("ada")),Center(child: Text("obi"))]) ,
            // this is the method of auto generating or predefined pages using pageview
            child: PageView.builder(
              controller: controller,
              onPageChanged: (ind) {
                setState(() {
                  this.index = ind;
                });
              },
              itemCount: ListGameModel.length,
              itemBuilder: (context, index) {
                this.index = index;
                return GameScreen(
                  sugestiona: ListGameModel[index].answerA,
                  sugestionb: ListGameModel[index].answerB,
                  sugestionc: ListGameModel[index].answerC,
                  sugestiond: ListGameModel[index].answerD,
                  image: ListGameModel[index].image,
                  correct_answer: ListGameModel[index].correctAnswer,
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              index == 0
                  ? SizedBox()
                  : Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: Color(0xff456395),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Prev",
                            style: GoogleFonts.aldrich(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ))),
              Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text(" Score : 0  ",textAlign: TextAlign.center,style: GoogleFonts.aldrich(fontSize: 20, fontWeight: FontWeight.bold),),

                  Text("$countdown Secs To Go  ",textAlign: TextAlign.center,style: GoogleFonts.aldrich(fontSize: 20, fontWeight: FontWeight.bold),),
                ],
              )),
              Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: Color(0xff456395),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20))),
                  child: TextButton(
                      onPressed: () {
                        controller.nextPage(
                            duration: Duration(seconds: 3),
                            curve: Curves.bounceIn);
                      },
                      child: Text(
                        "Next",
                        style: GoogleFonts.aldrich(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ))),
            ],
          ),
        ],
      ),
    );
  }
}
