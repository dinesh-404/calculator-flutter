import 'dart:math';

import 'package:flutter/material.dart';
import 'package:calc1/my_styles/my_styles.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var res = "0";
  var inpt = "0";
  var btnval = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"];
  void _change(var a) {
    if (a == "=") {
      Parser p = Parser();
      Expression exp = p.parse(inpt);
      double b = exp.evaluate(EvaluationType.REAL, ContextModel());

      setState(() {
        inpt = b.toString();
      });
    } else if (a == "AC") {
      inpt = "0";
    } else if (a == "DEL") {
      setState(() {
        inpt = inpt.substring(0, inpt.length - 1);
      });
    } else {
      setState(() {
        inpt += a;
      });
    }
  }

  void _clr() {
    setState(() {
      inpt = "cleared";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 12, 36, 62),
        elevation: 0.0,
      ),
      body: Container(
        color: Color.fromARGB(255, 12, 36, 62),
        child: Column(
          children: [
            Text(
              "$inpt",
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
            Row(children: [
              ElevatedButton(
                  onPressed: () {
                    _change("1");
                  },
                  style: myStyle(),
                  child: Text(
                    "1",
                    style: whiteBtnTxt(),
                  )),
              ElevatedButton(
                  onPressed: () {
                    _change("DEL");
                  },
                  style: myStyle(),
                  child: Text(
                    "+",
                    style: whiteBtnTxt(),
                  )),
              ElevatedButton(
                  onPressed: () {
                    _change("=");
                  },
                  style: myStyle(),
                  child: Text(
                    "=",
                    style: whiteBtnTxt(),
                  )),
            ]),
          ],
        ),
      ),
    );
  }
}
