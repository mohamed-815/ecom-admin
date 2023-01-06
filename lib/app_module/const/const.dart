import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const kwhite = Colors.white;
const kblack = Colors.black;
double? swidth = 0;
double? shieght = 0;

Swidth(context) {
  swidth = MediaQuery.of(context).size.width;
  return swidth;
}

Shieght(context) {
  shieght = MediaQuery.of(context).size.height;
  return shieght;
}

final khieght = SizedBox(
  height:
// 10
      15.h,
);

final kwidth = SizedBox(
  width:
// 10
      8.w,
);

final kwidth4 = SizedBox(
  width:
// 10
      32.w,
);

final khieght8 = SizedBox(
  height:
// 10
      8.h,
);

class Khieght4 extends StatelessWidget {
  const Khieght4({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        khieght,
        khieght,
        khieght,
        khieght,
      ],
    );
  }
}
