import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hold_down_button/hold_down_button.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:uni_vision_ofc/contents/google_sing_in.dart';
//import 'package:uni_vision_ofc/screens/login_page.dart';
import 'package:uni_vision_ofc/screens/password_reset.dart';
import 'package:uni_vision_ofc/screens/suporte.dart';

class CamerasMenu extends StatefulWidget {
  final int tempoGravado;
  const CamerasMenu(this.tempoGravado, {super.key});

  @override
  State<CamerasMenu> createState() => _CamerasMenuState();
}

class _CamerasMenuState extends State<CamerasMenu> {
  int tempo = 0;

  static const List<String> sampleImages = [
    'https://aprendacftv.com/wp-content/uploads/2017/07/camera-de-seguranca-com-infravermelho.jpg',
    'https://i.imgur.com/rF0GntM.jpg',
    'https://maisgeek.com/wp-content/uploads/2020/10/IMG_5059.pagespeed.ce_.K8pASs5uHi-2-1280x720.jpg',
    'https://blog.multigiga.com.vc/wp-content/uploads/2018/10/243852-aprenda-como-realizar-o-monitoramento-em-ambientes-escuros.jpg',
    'https://i.imgur.com/WyVaeti.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              signOutGoogle();
              //Navigator.of(context).pop();
            },
            icon: const Icon(Icons.exit_to_app_rounded),
          )
        ],
        title: const Text(
          'Home',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.amber,
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          DrawerHeader(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.amber,
            ),
            child: Center(
              child: Text(
                'Menu',
                style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo[800]),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(
                width: 270,
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const ResetPasswordPage();
                    }));
                  },
                  child: const Text(
                    'Alterar senha',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                width: 270,
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const Suporte();
                    }));
                  },
                  child: const Text(
                    'Suporte',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Divider(
                    color: Colors.black12,
                    thickness: 2,
                  ),
                  SizedBox(
                    child: Text(
                      'Usuario: ${user.email!}',
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 12),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                child: FanCarouselImageSlider(
                  imagesLink: sampleImages,
                  isAssets: false,
                  autoPlay: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: LinearProgressIndicator(
                  value: (widget.tempoGravado >= 0)
                      ? (tempo / widget.tempoGravado) / 10
                      : 1,
                  backgroundColor: Colors.amber[100],
                  color: Colors.amber,
                ),
              ),
              SizedBox(
                width: 70,
                height: 70,
                child: HoldDownButton(
                  onHoldDown: () {
                    setState(() {
                      tempo++;
                    });
                  },
                  child: FloatingActionButton(
                    backgroundColor: Colors.amber,
                    onPressed: () {},
                    child: const Icon(
                      Icons.videocam,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
