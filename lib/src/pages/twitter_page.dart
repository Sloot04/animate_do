import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TwitterPage extends StatefulWidget {
  @override
  _TwitterPageState createState() => _TwitterPageState();
}

class _TwitterPageState extends State<TwitterPage> {
  bool activar = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            activar = true;
          });
        },
        child: FaIcon(FontAwesomeIcons.play),
        backgroundColor: Colors.pink,
      ),
      backgroundColor: Color(0xff1DA1F2),
      body: Center(
        child: ZoomOut(
            animate: activar,
            from: 30,
            duration: Duration(seconds: 1),
            child: FaIcon(FontAwesomeIcons.twitter,
                color: Colors.white, size: 40)),
      ),
    );
  }
}
