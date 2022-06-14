import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../google_singn_in.dart';

class ZigyApp extends StatefulWidget {
  const ZigyApp({Key? key}) : super(key: key);

  @override
  State<ZigyApp> createState() => _ZigyAppState();
}

class _ZigyAppState extends State<ZigyApp> {
  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              Positioned.fill(
                  child: Opacity(
                opacity: 0.7,
                child: Image.asset(
                  'images/welcome.png',
                  fit: BoxFit.cover,
                ),
              )),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: SizedBox(
                        child: Image.asset(
                          'images/zigy.png',
                        ),
                        height: 250.0,
                      ),
                    ),
                    const SizedBox(
                      height: 100.0,
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          maximumSize: const Size(double.infinity, 50),
                          textStyle: const TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w900),
                          fixedSize: const Size(300, 300),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          )),
                      onPressed: () {
                        final provider = Provider.of<GoogleSignInProvider>(
                            context,
                            listen: false);
                        provider.googleLogin();
                      },
                      label: const Text('Log in with Google'),
                      icon: const FaIcon(
                        FontAwesomeIcons.google,
                        color: Color(0xFF7C68EF),
                        size: 35.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
