import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imagegame/models/gameModel.dart';
import 'package:imagegame/provider/gameProvider.dart';
import 'package:provider/provider.dart';

import '../widgets/gameScreen.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  int index = 0;
  PageController controller = PageController(initialPage: 0);



  @override
  dispose() {
    GameProvider(). ttimer?.cancel();
    super.dispose();
  }

  @override
  initState() {
    // this is for our hardcoded clock timing
    // startTimer_fortime();
  // GameProvider(). coundown2();
    super.initState();
  }
int count=0;
  @override
  Widget build(BuildContext context) {
    // if(count<2){
    //   Provider.of<GameProvider>(context,listen: false).coundown2();
    // }else{count++;}
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
              itemCount: Provider.of<GameProvider>(context,listen: true).ListGameModel.length,
              itemBuilder: (context, index) {
                this.index = index;
                return GameScreen(
                  sugestiona:Provider.of<GameProvider>(context,listen: true). ListGameModel[index].answerA,
                  sugestionb: Provider.of<GameProvider>(context,listen: true).ListGameModel[index].answerB,
                  sugestionc: Provider.of<GameProvider>(context,listen: true).ListGameModel[index].answerC,
                  sugestiond: Provider.of<GameProvider>(context,listen: true).ListGameModel[index].answerD,
                  image:Provider.of<GameProvider>(context,listen: true). ListGameModel[index].image,
                  correct_answer: Provider.of<GameProvider>(context,listen: true).ListGameModel[index].correctAnswer,
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
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    " Score : ${Provider.of<GameProvider>(context,listen: true).correctAnswerCounter}  ",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.aldrich(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${Provider.of<GameProvider>(context,listen: true).countdown} Secs To Go  ",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.aldrich(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
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
