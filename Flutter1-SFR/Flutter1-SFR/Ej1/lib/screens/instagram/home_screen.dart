import 'package:flutter/material.dart';
import '../screens.dart';

class Enlace8 extends StatelessWidget {
  const Enlace8({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
        body: const SingleChildScrollView(
          child: Column(
            children: [
              ProfileWidget(),
              ActionsWidget(),
              FooterWidget(),
              GridViewWidget(),
              LastFootWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
