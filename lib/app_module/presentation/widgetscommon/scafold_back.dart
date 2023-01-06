import 'package:flutter/material.dart';

class ScafoldBackGroundColor extends StatelessWidget {
  const ScafoldBackGroundColor({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(.3),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
    );
  }
}

class ScafoldBackGroundImage extends StatelessWidget {
  ScafoldBackGroundImage({
    required this.image,
    Key? key,
  }) : super(key: key);

  String image;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.cover,
    );
  }
}
