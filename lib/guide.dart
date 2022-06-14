import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zigy/screens/app.dart';
import 'navigation_bar.dart';

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
                return const NavigationBottomBar();
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
