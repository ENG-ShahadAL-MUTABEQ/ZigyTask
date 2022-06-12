import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImagesSliderPage extends StatefulWidget {
  const ImagesSliderPage({Key? key}) : super(key: key);

  @override
  State<ImagesSliderPage> createState() => _ImagesSliderPageState();
}

class _ImagesSliderPageState extends State<ImagesSliderPage> {
  final List<String> imgList = [
    "https://i.imgur.com/JX2y54V_d.webp?maxwidth=760&fidelity=grand",
    "https://i.imgur.com/h4DUJb8.png",
    "https://i.imgur.com/ksqKX8V.png"
  ];
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
      ),
      body: Center(
        child: CarouselSlider(
          options: CarouselOptions(
            height: 500,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            autoPlay: false,
            reverse: true,
            aspectRatio: 2.0,
          ),
          items: imgList
              .map(
                (e) => ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.network(
                        e,
                        width: 1000,
                        height: 1000,
                        fit: BoxFit.cover,
                      )
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
