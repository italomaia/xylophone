import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(XyloPage());
}

List<Color> btnColorList = [
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.orange,
  Colors.purple,
  Colors.pink,
  Colors.black,
];

class XyloPage extends StatefulWidget {
  @override
  _XyloPageState createState() => _XyloPageState();
}

class _XyloPageState extends State<XyloPage> {
  AudioCache player = AudioCache(prefix: 'assets/sounds/');

  @override
  void initState() {
    super.initState();

    player.loadAll(new List<String>.generate(7, (i) => 'note${i + 1}.wav'));
  }

  @override
  Widget build(BuildContext context) {
    List<Expanded> buttons = List<Expanded>.generate(
      7,
      (i) => Expanded(
        child: FlatButton(
          color: btnColorList[i],
          child: SizedBox(),
          onPressed: () {
            player.play('note${i + 1}.wav');
          },
        ),
      ),
    );

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: buttons,
          ),
        ),
      ),
    );
  }
}
