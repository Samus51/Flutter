import 'package:flutter/material.dart';
import 'instagram/grid_view_widget.dart';
import 'instagram/LastFootWidget.dart';
import 'instagram/actions_widget.dart';
import 'instagram/footer_widget.dart';
import 'instagram/profile_widget.dart';

void main() => runApp(const Enlace8());

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
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
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
