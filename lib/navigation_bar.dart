import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'screens/images_slider.dart';
import 'screens/three_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'google_singn_in.dart';

class NavigationBottomBar extends StatefulWidget {
  const NavigationBottomBar({Key? key}) : super(key: key);

  @override
  State<NavigationBottomBar> createState() => _NavigationBottomBarState();
}

class _NavigationBottomBarState extends State<NavigationBottomBar> {
  int index = 0;
  final screens = const [
    ImagesSliderPage(),
    ThreeDPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF7C68EF),
        leading: CircleAvatar(
          radius: 15.0,
          backgroundImage: NetworkImage(user.photoURL!),
        ),
        title: Text(
          'Welcome ' + user.displayName!,
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logout();
              },
              icon: const Icon(
                Icons.output,
                size: 30.0,
              ))
        ],
      ),
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.purple.shade100,
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(fontWeight: FontWeight.w300, fontSize: 15.0),
          ),
        ),
        child: NavigationBar(
          height: 60.0,
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          destinations: const [
            NavigationDestination(
              icon: Icon(
                Icons.image,
                color: Color(0xFF7C68EF),
              ),
              label: 'Image Slider',
            ),
            NavigationDestination(
              icon: FaIcon(
                FontAwesomeIcons.unity,
                color: Color(0xFF7C68EF),
              ),
              label: '3D',
            )
          ],
        ),
      ),
    );
  }
}
