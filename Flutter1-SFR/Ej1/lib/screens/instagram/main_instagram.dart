import 'package:flutter/material.dart';

import '../screens.dart';

class Enlace8 extends StatefulWidget {
  const Enlace8({super.key});

  @override
  State<Enlace8> createState() => _Enlace8State();
}

class _Enlace8State extends State<Enlace8> {
  bool isColorMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const Text('Ibai Llanos'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: const MenuLateral(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileWidget(),
            const ActionsWidget(),
            FooterWidget(
              onChangeMode: (bool newMode) {
                setState(() {
                  isColorMode = newMode;
                });
              },
            ),
            GridViewWidget(isColorMode: isColorMode),
            const LastFootWidget(),
          ],
        ),
      ),
    );
  }
}
