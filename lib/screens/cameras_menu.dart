import 'package:flutter/material.dart';
import 'package:hold_down_button/hold_down_button.dart';
//import 'package:uni_vision/contents/cameras.dart';
import 'package:uni_vision_ofc/contents/drawer_items.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';

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
    return Scaffold(
      appBar: AppBar(
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
          const Column(
            children: [
              DrawerItem('Gravar Tela'),
              DrawerItem('Configurações'),
              DrawerItem('Suporte'),
            ],
          ),
          const Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Divider(
                    color: Colors.black12,
                    thickness: 2,
                  ),
                  DrawerItem2('Sair'),
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
