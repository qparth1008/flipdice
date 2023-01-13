import 'dart:math';

import 'package:cubixd/cubixd.dart';
import 'package:flipdice/Demo.dart';
import 'package:flipdice/DemoPage.dart';
import 'package:flipdice/objModel.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: DemoPage(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController? _mainCtrl;
  Animation<double>? _xAnimation;
  Animation<double>? _yAnimation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AnimatedCubixD(
              advancedXYposAnim: AnimRequirements(
                controller: _mainCtrl!,
                xAnimation: _xAnimation!,
                yAnimation: _yAnimation!,
              ),
              restDuration: Duration(seconds: 2),
              selDuration: Duration(seconds: 2),
              onSelected: (SelectedSide opt) {
                switch (opt) {
                  case SelectedSide.back:
                    return true;
                  case SelectedSide.top:
                    return true;
                  case SelectedSide.front:
                    return true;
                  case SelectedSide.bottom:
                    return false; // out of service
                  case SelectedSide.right:
                    return true;
                  case SelectedSide.left:
                    return true;
                  case SelectedSide.none:
                    // You can do something else
                    return false; // Nothing will happend if you return true at this point
                  default:
                    throw Exception("Unimplemented option");
                }
              },
              size: 200.0,
              left: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/1-removebg-preview.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              front: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/2-removebg-preview.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              back: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/3-removebg-preview.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              top: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/4-removebg-preview.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              bottom: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/5-removebg-preview.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              right: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/6-removebg-preview.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {},
                child: Text(
                  "start",
                )),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    defaultt();
  }

  void defaultt() {
    _mainCtrl = new AnimationController(duration: Duration(seconds: 10), vsync: this);

    _xAnimation = Tween<double>(begin: -pi / 4, end: pi * 2 - pi / 4).animate(_mainCtrl!);
    _yAnimation = Tween<double>(begin: pi / 4, end: pi / 4).animate(_mainCtrl!);

    _mainCtrl?.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _mainCtrl?.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _mainCtrl?.forward();
      }
      print(status);
    });

    _mainCtrl?.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _mainCtrl?.dispose();
  }
}
