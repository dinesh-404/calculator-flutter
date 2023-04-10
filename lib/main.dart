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
  var inpt = "0";
  void _change(var a) {
    if (inpt == "0" && a == "DEL") {
      inpt = "0";
    } else if (inpt == "0") {
      setState(() {
        inpt = a;
      });
    } else if (a == "=") {
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
      inpt = "0";
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
        padding: EdgeInsets.all(10),
        color: Color.fromARGB(255, 12, 36, 62),
        // color: Colors.black,
        child: Column(
          children: [
            Container(
              height: 200,
              alignment: Alignment.bottomRight,
              child: Text(
                "$inpt",
                style: TextStyle(fontSize: 140, color: Colors.white),
              ),
            ),
            Container(
                // color: Colors.grey,
                child: Column(
              children: [
                // first row
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            _change("+");
                          },
                          style: diffButton(),
                          child: Text(
                            "+",
                            style: whiteBtnTxt(),
                          )),
                      ElevatedButton(
                          onPressed: () {
                            _change("-");
                          },
                          style: diffButton(),
                          child: Text(
                            "-",
                            style: whiteBtnTxt(),
                          )),
                      ElevatedButton(
                          onPressed: () {
                            _change("*");
                          },
                          style: diffButton(),
                          child: Text(
                            "*",
                            style: whiteBtnTxt(),
                          )),
                      ElevatedButton(
                          onPressed: () {
                            _change("/");
                          },
                          style: diffButton(),
                          child: Text(
                            "/",
                            style: whiteBtnTxt(),
                          )),
                    ]),
                SizedBox(height: 15),
                // second row
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            _change("7");
                          },
                          style: tButton(),
                          child: Text(
                            "7",
                            style: whiteBtnTxt(),
                          )),
                      ElevatedButton(
                          onPressed: () {
                            _change("8");
                          },
                          style: tButton(),
                          child: Text(
                            "8",
                            style: whiteBtnTxt(),
                          )),
                      ElevatedButton(
                          onPressed: () {
                            _change("9");
                          },
                          style: tButton(),
                          child: Text(
                            "9",
                            style: whiteBtnTxt(),
                          )),
                      ElevatedButton(
                          onPressed: () {
                            _change("DEL");
                          },
                          style: diffButton(),
                          child: Text(
                            "DEL",
                            style: whiteBtnTxt(),
                          )),
                    ]),

                SizedBox(height: 15),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: 300,
                        child: Column(
                          children: [
                            // third row
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        _change("4");
                                      },
                                      style: tButton(),
                                      child: Text(
                                        "4",
                                        style: whiteBtnTxt(),
                                      )),
                                  ElevatedButton(
                                      onPressed: () {
                                        _change("5");
                                      },
                                      style: tButton(),
                                      child: Text(
                                        "5",
                                        style: whiteBtnTxt(),
                                      )),
                                  ElevatedButton(
                                      onPressed: () {
                                        _change("6");
                                      },
                                      style: tButton(),
                                      child: Text(
                                        "6",
                                        style: whiteBtnTxt(),
                                      )),
                                ]),
                            // fourth row
                            SizedBox(height: 15),

                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        _change("1");
                                      },
                                      style: tButton(),
                                      child: Text(
                                        "1",
                                        style: whiteBtnTxt(),
                                      )),
                                  ElevatedButton(
                                      onPressed: () {
                                        _change("2");
                                      },
                                      style: tButton(),
                                      child: Text(
                                        "2",
                                        style: whiteBtnTxt(),
                                      )),
                                  ElevatedButton(
                                      onPressed: () {
                                        _change("3");
                                      },
                                      style: tButton(),
                                      child: Text(
                                        "3",
                                        style: whiteBtnTxt(),
                                      )),
                                ]),
                            // fifth row
                            SizedBox(height: 15),

                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        _clr();
                                      },
                                      style: ElevatedButton.styleFrom(
                                          shape: CircleBorder(),
                                          minimumSize: Size(80, 80),
                                          backgroundColor: Colors.red),
                                      child: Text("AC", style: whiteBtnTxt())),
                                  ElevatedButton(
                                      onPressed: () {
                                        _change("0");
                                      },
                                      style: tButton(),
                                      child: Text(
                                        "0",
                                        style: whiteBtnTxt(),
                                      )),
                                  ElevatedButton(
                                      onPressed: () {
                                        _change(".");
                                      },
                                      style: tButton(),
                                      child: Text(
                                        ".",
                                        style: whiteBtnTxt(),
                                      )),
                                ]),
                          ],
                        )),
                    SizedBox(width: 5),
                    Container(
                      child: ElevatedButton(
                        child: Text(
                          "=",
                          style: TextStyle(fontSize: 50),
                        ),
                        onPressed: () {
                          _change("=");
                        },
                        style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            backgroundColor: Color.fromRGBO(91, 125, 162, 1),
                            minimumSize: Size(75, 250)),
                      ),
                    ),
                  ],
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
