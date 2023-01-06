import 'package:flutter/material.dart';

class StaggeredItemText extends StatelessWidget {
  StaggeredItemText({
    Key? key,
    required this.item,
  }) : super(key: key);

  String item;

  @override
  Widget build(BuildContext context) {
    return Text(
      item,
      style: const TextStyle(
        color: Color.fromARGB(255, 242, 241, 241),
      ),
    );
  }
}
