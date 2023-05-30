import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String item;
  const DrawerItem(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 270,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
            onPressed: () {},
            child: Text(
              item,
              style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }
}

class DrawerItem2 extends StatelessWidget {
  final String item;
  const DrawerItem2(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 270,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[800]),
            onPressed: () {},
            child: Text(
              item,
              style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }
}
