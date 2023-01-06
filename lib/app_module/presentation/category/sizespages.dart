import 'package:adminside/app_module/presentation/category/insidecategory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class DifferentSizePage extends StatelessWidget {
  DifferentSizePage(
      {required this.isactuallyinoffer, required this.category, super.key});
  String category;
  String large = 'large';
  String meadium = 'medium';
  String small = 'small';
  String isactuallyinoffer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        backgroundColor: Color.fromARGB(255, 77, 25, 91),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          GestureDetector(
            onTap: () => Get.to(() => InSideCategory(
                isactuallyinoffer: isactuallyinoffer,
                size: small,
                category: category)),
            child: SizeContainer(small: small),
          ),
          GestureDetector(
            onTap: () => Get.to(() => InSideCategory(
                isactuallyinoffer: isactuallyinoffer,
                size: meadium,
                category: category)),
            child: SizeContainer(small: meadium),
          ),
          GestureDetector(
            onTap: () => Get.to(() => InSideCategory(
                isactuallyinoffer: isactuallyinoffer,
                size: large,
                category: category)),
            child: SizeContainer(small: large),
          ),
        ],
      )),
    );
  }
}

class SizeContainer extends StatelessWidget {
  const SizeContainer({
    Key? key,
    required this.small,
  }) : super(key: key);

  final String small;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        margin: EdgeInsets.all(30),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          color: Color.fromARGB(255, 136, 133, 136),
        ),
        child: Center(
            child: Text(
          small,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            fontFamily: "Font1",
            color: Color.fromARGB(255, 75, 17, 85),
          ),
        )));
  }
}
