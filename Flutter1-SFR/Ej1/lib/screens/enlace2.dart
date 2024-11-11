import 'package:flutter/material.dart';
import '../drawer/menu_lateral.dart';

class Enlace2 extends StatefulWidget {
  const Enlace2({super.key});

  @override
  _Enlace2State createState() => _Enlace2State();
}

class _Enlace2State extends State<Enlace2> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text('Enlace 2'),
        ),
        drawer: const MenuLateral(),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            "assets/images/ibai.jpg",
            scale: 2.5,
          ),
          Image.asset("assets/images/ibai.jpg", scale: 2.5),
          Image.asset("assets/images/ibai.jpg", scale: 2.5),
        ])));
  }
}
