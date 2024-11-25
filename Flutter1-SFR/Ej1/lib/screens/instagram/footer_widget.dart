import 'package:flutter/material.dart';

class FooterWidget extends StatefulWidget {
  final Function(bool) onChangeMode;

  const FooterWidget({super.key, required this.onChangeMode});

  @override
  State<FooterWidget> createState() => _FooterWidgetState();
}

class _FooterWidgetState extends State<FooterWidget> {
  int selectedIcon = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Container(
            width: 450,
            height: 1,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Colors.grey.withOpacity(0.3),
                  width: 2,
                ),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.view_compact),
                  onPressed: () {
                    setState(() {
                      selectedIcon = 0;
                    });
                    widget.onChangeMode(false);
                  },
                ),
                if (selectedIcon == 0)
                  Container(
                    width: 40,
                    height: 2,
                    color: Colors.grey,
                  ),
              ],
            ),
            Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.account_box_outlined),
                  onPressed: () {
                    setState(() {
                      selectedIcon = 1;
                    });
                    widget.onChangeMode(true);
                  },
                ),
                if (selectedIcon == 1)
                  Container(
                    width: 40,
                    height: 2,
                    color: Colors.grey,
                  ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                height: 1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
