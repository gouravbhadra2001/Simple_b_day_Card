import 'dart:core';
import 'dart:ffi';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'screen1.dart';
class BirthdayScreen extends StatefulWidget {
  final String name;
  final int age;

  BirthdayScreen({required this.name, required this.age});
  @override
  _BirthdayScreenState createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  var now = DateTime.now();

  @override
  void initState() {

    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween<double>(begin: 0.8, end: 1.2).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(0.5, 1, curve: Curves.elasticOut)
    ));
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        actions: [Icon(Icons.celebration_outlined), Icon(Icons.celebration_rounded), Icon(Icons.celebration)],
        title: Text("Congo ${widget.name}, itz ur day", textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, shadows: [Shadow(
            offset: Offset(2.5, -2.5), //position of shadow
            blurRadius: 2.0, //blur intensity of shadow
            color: Colors.black.withOpacity(
                0.5), //color of shadow with opacity
          ),
          ], fontWeight: FontWeight.bold),),
        bottomOpacity: 0,
        scrolledUnderElevation: 40.0,
        elevation: 5,
        shape: StadiumBorder(side: BorderSide.none),
        backgroundColor: Colors.black,
        shadowColor: Colors.black,

        leading: Icon(Icons.celebration_sharp, color: Colors.white, shadows: [Shadow(
          offset: Offset(2.5, -2.5), //position of shadow
          blurRadius: 2.0, //blur intensity of shadow
          color: Colors.blue.withOpacity(
              0.9), //color of shadow with opacity
        ),
        ],),),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/images/birthday_background.gif"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ScaleTransition(
              scale: _animation,
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    colors: [Colors.yellow, Colors.pink,Colors.white,Colors.orange, Colors.white,Colors.yellowAccent, Colors.white],
                    tileMode: TileMode.repeated,
                  ).createShader(bounds);
                },
                child: Text(widget.name + ", you've reached " + (now.year-widget.age).toString()+"th Year after birth. "+"Wishing you all the best on your special day!" ,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),

          ],
        ),
      ),
    );
  }
}
