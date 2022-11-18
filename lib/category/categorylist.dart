import 'package:adminside/category/insidecategory.dart';

import 'package:adminside/user/prodectside/productadding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 44, 43, 43),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 75, 17, 85),
        ),
        body: SafeArea(
            child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'varieties',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ...<String>[
              'Aquarium',
              'Edibleseeds',
              'birds',
              'Accessories',
              'feeds'
            ].map((String value) {
              return GestureDetector(
                onTap: () => Get.to(() => InSideCategory()),
                child: Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/images.jpeg'),
                    ),
                    title: Text(
                      value,
                      style: TextStyle(
                          fontSize: 20, color: Color.fromARGB(255, 21, 20, 20)),
                    ),
                  ),
                ),
              );
            }).toList(),
          ],
        )));
  }
}
