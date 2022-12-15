import 'package:adminside/controller/productsidecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class radioButton extends StatelessWidget {
  radioButton({
    Key? key,
    required this.value,
    required this.onChange,
  }) : super(key: key);
  String value;
  void Function(String?)? onChange;
  @override
  Widget build(BuildContext context) {
    return GetX<ProductAddingController>(
        init: ProductAddingController(),
        builder: (c) {
          return Radio(
              focusColor: Colors.grey,
              hoverColor: Colors.grey,
              fillColor:
                  MaterialStateColor.resolveWith((states) => Colors.white),
              value: value,
              groupValue: c.basevaleu.value,
              onChanged: onChange);
        });
  }
}
