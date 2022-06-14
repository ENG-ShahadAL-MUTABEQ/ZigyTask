import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';

class ThreeDPage extends StatefulWidget {
  const ThreeDPage({Key? key}) : super(key: key);

  @override
  State<ThreeDPage> createState() => _ThreeDPageState();
}

class _ThreeDPageState extends State<ThreeDPage> {
  late Object dress;
  @override
  void initState() {
    dress = Object(fileName: 'images/dress/dress.obj');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Cube(
        interactive: true,
        onSceneCreated: (Scene scene) {
          scene.world.add(dress);
          scene.camera.zoom = 10;
        },
      ),
    );
  }
}
