import 'dart:async';
import 'dart:math';

import 'package:cubixd/cubixd.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';

/// Create By Parth 04/01/2023
class DemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new DemoPageState();
  }
}

class DemoPageState extends State<DemoPage> {
  // Offset offset = Offset.zero;
  double rx = 0.0, ry = 0.0, rz = 0.0;
  String ans = "";

  List<String> diceList1 = ["assets/1.png", "assets/2.png", "assets/3.png", "assets/4.png", "assets/5.png", "assets/6.png"];
  List<String> diceList3 = ["assets/1-dice.png", "assets/2-dice.png", "assets/3-dice.png", "assets/4-dice.png", "assets/5-dice.png", "assets/6-dice.png"];
  List<String> diceList2 = ["assets/1-removebg-preview.png", "assets/2-removebg-preview.png", "assets/3-removebg-preview.png", "assets/4-removebg-preview.png", "assets/5-removebg-preview.png", "assets/6-removebg-preview.png"];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        rx += details.delta.dx * 0.01;
        ry += details.delta.dy * 0.01;
        setState(() {
          rx %= pi * 2;
          ry %= pi * 2;
          // offset += details.delta;
          // Offset(
          // offset.dx + details.delta.dx,
          // offset.dy + details.delta.dy);
        });
      },
      child: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CubixD(
              size: 200.0,
              front: diceSide(diceList3[0]),
              left: diceSide(diceList3[1]),
              back: diceSide(diceList3[2]),
              top: diceSide(diceList3[3]),
              bottom: diceSide(diceList3[4]),
              right: diceSide(diceList3[5]),
              delta: Vector2(rx, ry),
            ),
          ),
          // Transform(
          //     transform: Matrix4.identity()
          //       ..rotateX(rx)
          //       ..rotateZ(rz)
          //       ..rotateY(ry)
          //     ,
          //     alignment: Alignment.center,
          //     child: Center(child: Cube())),
          SizedBox(
            height: 50,
          ),
          // Slider(
          //   value: rx,
          //   min: pi * -2,
          //   max: pi * 2,
          //   onChanged: (value) {
          //     setState(() {
          //       rx = value;
          //       // offset = Offset(0, value);
          //     });
          //   },
          // ),
          // Slider(
          //   value: ry,
          //   min: pi * -2,
          //   max: pi * 2,
          //   onChanged: (value) {
          //     setState(() {
          //       ry = value;
          //       // offset = Offset(0, value);
          //     });
          //   },
          // ),
          // Slider(
          //   value: rz,
          //   min: pi * -2,
          //   max: pi * 2,
          //   onChanged: (value) {
          //     setState(() {
          //       print(value);
          //       rz = value;
          //       // offset = Offset(0, value);
          //     });
          //   },
          // ),
          ElevatedButton(
              onPressed: () {
                ans = "";
                diceList3.shuffle();
                setState(() {});
                double s = (pi * -2);
                double e = (pi * 2);
                dynamic oneSec = Duration(milliseconds: 20);
                _timer = Timer.periodic(
                  oneSec,
                  (Timer timer) {
                    if (s >= e) {
                      setState(() {
                        timer.cancel();
                        ans = diceList3[0].split("/")[1].split("-")[0].toString();
                        print("ans = ${diceList3[0]}");
                      });
                    } else {
                      setState(() {
                        s = s + 0.15;
                        rx = s;
                        ry = s;
                      });
                    }
                  },
                );
              },
              child: Text(
                "START",
                style: TextStyle(fontSize: 20),
              )),
          SizedBox(
            height: 20,
          ),
          Text(
            "$ans",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          )
        ],
      )),
    );
  }

  Timer? _timer;

  void startTimer() {}

  @override
  void initState() {
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  diceSide(String imgName) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        image: DecorationImage(
          image: AssetImage(imgName),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class Cube extends StatelessWidget {
  const Cube({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()..translate(0.0, 0.0, 100.0),
          child: Container(
              height: 200,
              width: 200,
              // color: Colors.brown,
              child: Image.asset(
                "assets/triangle.png",
                fit: BoxFit.fill,
              )),
        ),
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()..translate(100.0, 0.0, -100.0),
          child: Container(
              height: 200,
              width: 200,
              // color: Colors.brown,
              child: Image.asset(
                "assets/triangle.png",
                fit: BoxFit.fill,
              )),
        ),
        // Container(
        //   // alignment: Alignment.center,
        //
        //   transformAlignment: Alignment.center,
        //   transform: Matrix4.identity()..translate(0.0, 0.0, -100.0),
        //   child: Container(
        //       height: 200,
        //       width: 200,
        //       color: Colors.green,
        //       child: Image.asset(
        //         "assets/2.png",
        //         fit: BoxFit.fill,
        //       )),
        // ),
        // Transform(
        //     alignment: Alignment.center,
        //     transform: Matrix4.identity()
        //       ..translate(100.0, 0.0, 0.0)
        //       ..rotateY(-pi / 2),
        //     child: Container(
        //         height: 200,
        //         width: 200,
        //         color: Colors.orange,
        //         child: Image.asset(
        //           "assets/3.png",
        //           fit: BoxFit.fill,
        //         ))),
        // Transform(
        //     alignment: Alignment.center,
        //     transform: Matrix4.identity()
        //       ..translate(-100.0, 0.0, 0.0)
        //       ..rotateY(pi / 2),
        //     child: Container(
        //         height: 200,
        //         width: 200,
        //         color: Colors.purple,
        //         child: Image.asset(
        //           "assets/4.png",
        //           fit: BoxFit.fill,
        //         ))),
        // Transform(
        //     alignment: Alignment.center,
        //     transform: Matrix4.identity()
        //       ..translate(0.0, 100.0, 0.0)
        //       ..rotateX(pi / 2),
        //     child: Container(
        //         height: 200,
        //         width: 200,
        //         color: Colors.blue,
        //         child: Image.asset(
        //           "assets/5.png",
        //           fit: BoxFit.fill,
        //         ))),
        // Transform(
        //     alignment: Alignment.center,
        //     transform: Matrix4.identity()
        //       ..translate(0.0, -100.0, 0.0)
        //       ..rotateX(pi / 2),
        //     child: Container(
        //         height: 200,
        //         width: 200,
        //         color: Colors.red,
        //         child: Image.asset(
        //           "assets/6.png",
        //           fit: BoxFit.fill,
        //         ))),
      ],
    );
  }
}
