import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double red = 255, green = 255, blue = 255;
  double opacity = 1;
  double buttonWidth = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color.fromRGBO(red.round(), green.round(), blue.round(), opacity),
      appBar: AppBar(
        title: Text('Color Slider'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'RGB(${red.round()},${green.round()},${blue.round()})',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  color: green == 0 ? Colors.white : Colors.black),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
            ),
            Column(
              children: [
                Text(
                  'Red:${red.round()}',
                  style: TextStyle(
                      color: green == 0 ? Colors.white : Colors.black),
                ),
                Slider(
                    value: red,
                    min: 0,
                    max: 255,
                    activeColor: Colors.red,
                    label: red.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        red = value;
                      });
                    }),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Green:${green.round()}',
                  style: TextStyle(
                      color: green == 0 ? Colors.white : Colors.black),
                ),
                Slider(
                    value: green,
                    min: 0,
                    max: 255,
                    activeColor: Colors.green,
                    label: green.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        green = value;
                      });
                    }),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Blue:${blue.round()}',
                  style: TextStyle(
                      color: green == 0 ? Colors.white : Colors.black),
                ),
                Slider(
                    value: blue,
                    min: 0,
                    max: 255,
                    activeColor: Colors.blue,
                    label: blue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        blue = value;
                      });
                    }),

                //reset colours
                Container(
                  width: buttonWidth,
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          red = 255;
                          blue = 255;
                          green = 255;
                        });
                      },
                      child: Text('Reset')),
                ),

                //Random Button
                Container(
                  width: buttonWidth,
                  child: ElevatedButton(
                    onPressed: _randomizeValues,
                    child: Text('Random'),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  _randomizeValues() {
    Random rnd = Random();
    red = rnd.nextInt(256).toDouble();
    blue = rnd.nextInt(256).toDouble();
    green = rnd.nextInt(256).toDouble();
    setState(() {});
  }
}
