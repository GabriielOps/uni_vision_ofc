import 'package:flutter/material.dart';
import 'package:uni_vision_ofc/screens/cameras_menu.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Home());
  FirebaseFirestore.instance
      .collection('collectionPath')
      .doc('documento')
      .set({'texto': 'funcionou'});
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: CamerasMenu(5));
  }
}
