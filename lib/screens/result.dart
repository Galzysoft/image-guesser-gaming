import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/gameProvider.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var   _provider_true= Provider.of<GameProvider>(context,listen: true);
    return Scaffold(body: Center(child: Text("congrats you score ${_provider_true.correctAnswerCounter}")),);
  }
}
