import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  String? sugestiona = "ada",
      sugestionb = "azu",
      sugestionc = "emma",
      sugestiond = "oke";
int index=0;
  PageController controller=PageController(initialPage: 0);
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
              controller: controller,onPageChanged:(ind) {

              setState((){this.index=ind;});
            },
              itemCount: 2,
              itemBuilder: (context, index) {
                this.index=index;
                return GameScreen(sugestiona: sugestiona, sugestionb: sugestionb, sugestionc: sugestionc, sugestiond: sugestiond,image: "asset/imageguesser.jpg",correct_answer: "ada",);
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          index==0?SizedBox():    Container(
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
             Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: Color(0xff456395),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20))),
                  child: TextButton(
                      onPressed: () {},
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

class GameScreen extends StatelessWidget {
  const GameScreen({
    Key? key,
    required this.sugestiona,
    required this.sugestionb,
    required this.sugestionc,
    required this.sugestiond, required this.correct_answer,required this.image,
  }) : super(key: key);

  final String? sugestiona;
  final String? sugestionb;
  final String? sugestionc;
  final String? sugestiond;
  final String? correct_answer;
  final String? image;
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
                  image!,
                  fit: BoxFit.contain,
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
                      border:
                          Border.all(color: Colors.black, width: 2),
                      color: Colors.purple),
                  child: TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text(
                          "a. $sugestiona",
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
                      border:
                          Border.all(color: Colors.black, width: 2),
                      color: Colors.purple),
                  child: TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text(
                          "b. $sugestionb",
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
                      border:
                          Border.all(color: Colors.black, width: 2),
                      color: Colors.purple),
                  child: TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text(
                          "c. $sugestionc",
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
                      border:
                          Border.all(color: Colors.black, width: 2),
                      color: Colors.purple),
                  child: TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text(
                          "d. $sugestiond",
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
