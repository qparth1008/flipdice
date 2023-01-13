import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class objModel extends StatefulWidget {
  const objModel({Key? key}) : super(key: key);

  @override
  State<objModel> createState() => _objModelState();
}

class _objModelState extends State<objModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Model Viewer")),
      body:
          /*Container(child: BabylonJSViewer(
        src: 'assets/dice.glb',
      ),)*/
          // Container(
          // Cube(interactive: true,onSceneCreated: (scene) {
          //
          //   scene.world.add(Object(fileName: 'assets/dice.obj'));
          // },),
          // )
          ModelViewer(
        backgroundColor: Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
        src: 'assets/dice.glb',
        // a bundled asset file
        alt: "A 3D model of an astronaut",
        ar: true,
        arModes: ['scene-viewer', 'webxr', 'quick-look'],
        autoRotate: true,
        cameraControls: true,
        disableZoom: true,
      ),
    );
  }
}
