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
            child: PageView.builder(controller: controller,onPageChanged:(ind) {

              setState((){this.index=ind;});
            },
              itemCount: 2,
              itemBuilder: (context, index) {
                this.index=index;
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
                              "asset/imageguesser.jpg",
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
