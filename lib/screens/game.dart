import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imagegame/models/gameModel.dart';
import 'package:imagegame/provider/gameProvider.dart';
import 'package:imagegame/screens/result.dart';
import 'package:provider/provider.dart';

import '../widgets/gameScreen.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  int index = 0;




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
  var   _provider_false= Provider.of<GameProvider>(context,listen: false);
  var   _provider_true= Provider.of<GameProvider>(context,listen: true);
    // }else{count++;}
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            //this is the selfdefined method of creating  pages in pageview
            // child:PageView(children: [Center(child: Text("ada")),Center(child: Text("obi"))]) ,
            // this is the method of auto generating or predefined pages using pageview
            child: PageView.builder(
              controller: _provider_false.controller,
              onPageChanged: (ind) {
                print("ada");
                if(ind!= _provider_true.ListGameModel.length-1){
                _provider_false.coundown2(totalSeconds:_provider_false. ListGameModel[ind].seconds );
                _provider_true.ListGameModel.removeAt(this.index);
                setState(() {
                  this.index = ind;
                });}else{
                  // if( _provider_true.ListGameModel)
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResultScreen(),));
                }


              },
              itemCount: _provider_true.ListGameModel.length,
              itemBuilder: (context, index) {
                this.index = index;
                return
                  GameScreen(seconds:_provider_true. ListGameModel[index].seconds ,
                  sugestiona:_provider_true. ListGameModel[index].answerA,
                  sugestionb: _provider_true.ListGameModel[index].answerB,
                  sugestionc: _provider_true.ListGameModel[index].answerC,
                  sugestiond: _provider_true.ListGameModel[index].answerD,
                  image:_provider_true. ListGameModel[index].image,
                  correct_answer: _provider_true.ListGameModel[index].correctAnswer,
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
                    " Score : ${_provider_true.correctAnswerCounter}  ",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.aldrich(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${_provider_true.countdown} Secs To Go  ",
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
                        _provider_false.controller.nextPage(
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
