import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uni_vision_ofc/screens/cameras_menu.dart';
import 'package:uni_vision_ofc/screens/login_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const CamerasMenu(5);
        } else {
          return const LoginPage();
        }
      },
    ));
  }
}
