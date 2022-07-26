
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GameScreen extends StatefulWidget {
  GameScreen({
    Key? key,
    required this.sugestiona,
    required this.sugestionb,
    required this.sugestionc,
    required this.sugestiond,
    required this.correct_answer,
    required this.image,
  }) : super(key: key);

  final String? sugestiona;
  final String? sugestionb;
  final String? sugestionc;
  final String? sugestiond;
  final String? correct_answer;
  final String? image;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  //we create a bool value to check if the answerts are values in a ,b,c,d
  bool answerisA = false,
      answerisB = false,
      answerisC = false,
      answerisD = false;
  bool isClikedA = false,
      isClikedB = false,
      isClikedC = false,
      isClikedD = false;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            SizedBox(
              child: Material(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                elevation: 20,
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Image.asset(
                      widget.image!,
                      fit: BoxFit.cover,height: 300,width: double.infinity,
                    )),
              ),
            ),
            Flexible(
                child: SizedBox(
                  height: 500,
                  width: 500,
                  child: Column(children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "What Is My Name",
                          style: GoogleFonts.aldrich(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black, width: 2),
                              color: isClikedA &&answerisA?Colors.green:isClikedA &&!answerisA?Colors.red:Colors.purple),
                          child: TextButton(onHover: (value) {

                          },
                            onPressed: () {
                              setState((){ isClikedA = true;})   ;
                              if (widget.sugestiona == widget.correct_answer) {
                                setState((){ answerisA = true;isClikedA = true;})   ;
                              }else   if (widget.sugestionb == widget.correct_answer) {
                                setState((){ answerisB = true;
                                isClikedB = true;})   ;
                              }else   if (widget.sugestionc == widget.correct_answer) {
                                setState((){ answerisC = true;
                                isClikedC = true;})   ;
                              }else   if (widget.sugestiond == widget.correct_answer) {
                                setState((){ answerisD = true; isClikedD = true;})   ;
                              }
                            },
                            child: Row(
                              children: [
                                Text(
                                  "a. ${widget.sugestiona}",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.aldrich(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black, width: 2),
                              color: isClikedB &&answerisB?Colors.green:isClikedB &&!answerisB?Colors.red:Colors.purple),

                          child: TextButton(
                            onPressed: () {
                              setState((){ isClikedB = true;})   ;
                              if (widget.sugestiona == widget.correct_answer) {
                                setState((){ answerisA = true;   isClikedA = true;})   ;
                              }else   if (widget.sugestionb == widget.correct_answer) {
                                setState((){ answerisB = true;
                                isClikedB = true;})   ;
                              }else   if (widget.sugestionc == widget.correct_answer) {
                                setState((){ answerisC = true;
                                isClikedC = true;})   ;
                              }else   if (widget.sugestiond == widget.correct_answer) {
                                setState((){ answerisD = true; isClikedD = true;})   ;
                              }

                            },
                            child: Row(
                              children: [
                                Text(
                                  "b. ${widget.sugestionb}",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.aldrich(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black, width: 2),
                              color: isClikedC &&answerisC?Colors.green:isClikedC &&!answerisC?Colors.red:Colors.purple),

                          child: TextButton(
                            onPressed: () {          setState((){ isClikedC = true;})   ;
                            if (widget.sugestiona == widget.correct_answer) {
                              setState((){ answerisA = true;   isClikedA = true;})   ;
                            }else   if (widget.sugestionb == widget.correct_answer) {
                              setState((){ answerisB = true;
                              isClikedB = true;})   ;
                            }else   if (widget.sugestionc == widget.correct_answer) {
                              setState((){ answerisC = true;
                              isClikedC = true;})   ;
                            }else   if (widget.sugestiond == widget.correct_answer) {
                              setState((){ answerisD = true; isClikedD = true;})   ;
                            }},
                            child: Row(
                              children: [
                                Text(
                                  "c. ${widget.sugestionc}",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.aldrich(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black, width: 2),
                              color: isClikedD &&answerisD?Colors.green:isClikedD &&!answerisD?Colors.red:Colors.purple),

                          child: TextButton(
                            onPressed: () {          setState((){ isClikedD = true;})   ;
                            if (widget.sugestiona == widget.correct_answer) {
                              setState((){ answerisA = true;
                              isClikedA = true;
                              })   ;
                            }else   if (widget.sugestionb == widget.correct_answer) {
                              setState((){ answerisB = true;
                              isClikedB = true;})   ;
                            }else   if (widget.sugestionc == widget.correct_answer) {
                              setState((){ answerisC = true;
                              isClikedC = true;})   ;
                            }else   if (widget.sugestiond == widget.correct_answer) {
                              setState((){ answerisD = true; isClikedD = true;})   ;
                            }},
                            child: Row(
                              children: [
                                Text(
                                  "d. ${widget.sugestiond}",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.aldrich(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ]),
                ))
          ],
        ));
  }
}