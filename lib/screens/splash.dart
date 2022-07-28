import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imagegame/provider/gameProvider.dart';
import 'package:imagegame/screens/game.dart';
import 'package:provider/provider.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "asset/imageguesser.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                  Colors.black.withOpacity(0.9),
                  Colors.black.withOpacity(0.6),
                  Colors.black.withOpacity(0.4)
                ])),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "Image Guesser",
                style: GoogleFonts.aldrich(fontSize: 40, color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "... Lets Enjoy the Game",
                style: GoogleFonts.aldrich(fontSize: 20, color: Colors.white),
              ),
              SizedBox(
                height: 50,
              ),
            ]),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 48.0),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xff007B82)),),
                onPressed: () {
                  Provider.of<GameProvider>(context,listen: false).coundown2();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Game(),));},
                child: Text(
                  "Lets Start",
                  style: GoogleFonts.aldrich(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
