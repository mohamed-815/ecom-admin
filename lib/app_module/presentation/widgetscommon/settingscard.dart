import 'package:adminside/app_module/presentation/user/order.dart';
import 'package:flutter/material.dart';

class CarttileSettings extends StatelessWidget {
  CarttileSettings({
    required this.data,
    Key? key,
  }) : super(key: key);
  String data;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Text(data),
      ),
    );
  }
}

class GreyText1 extends StatelessWidget {
  GreyText1({
    required this.title,
    Key? key,
  }) : super(key: key);
  String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(color: Color.fromARGB(255, 223, 220, 220)),
    );
  }
}

class More extends StatelessWidget {
  const More({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kwidth,
        kwidth,
        kwidth,
        kwidth,
        GreyText(title: 'More'),
        kwidth,
      ],
    );
  }
}

class GreyText extends StatelessWidget {
  GreyText({
    required this.title,
    Key? key,
  }) : super(key: key);
  String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(color: Colors.grey),
    );
  }
}
