import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextField1 extends StatelessWidget {
  TextField1({
    Key? key,
    this.controller1,
    this.icon,
    required this.hint,
    required this.lebel,
  }) : super(key: key);
  String lebel;
  String hint;
  IconData? icon;
  TextEditingController? controller1;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller1,
      //obscureText: true,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                BorderSide(color: Color.fromARGB(255, 11, 11, 11), width: 1.h),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 72, 71, 71),
            ),
          ),
          hintStyle: TextStyle(color: Colors.black),
          labelStyle: TextStyle(color: Colors.black),
          labelText: lebel,
          hintText: hint,
          suffixIcon: Icon(
            icon,
            color: Colors.black,
          )),
    );
  }
}
