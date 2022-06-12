import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zigy/app.dart';
import 'images_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: (CircularProgressIndicator()));
              } else if (snapshot.hasData) {
                return const ImagesSliderPage();
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('Something Wrong!!'),
                );
              } else {
                return const ZigyApp();
              }
            }));
  }
}
