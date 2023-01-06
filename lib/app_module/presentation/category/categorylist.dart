import 'dart:developer';
import 'dart:ffi';

import 'package:adminside/app_module/modelclass/modelclass.dart';
import 'package:adminside/app_module/presentation/category/insidecategory.dart';
import 'package:adminside/app_module/presentation/category/sizespages.dart';

import 'package:adminside/app_module/presentation/prodectside/productadding.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class CategoryList extends StatelessWidget {
  CategoryList(
      {required this.isactuallyinoffer,
      required this.offer,
      required this.streamallthing,
      super.key});
  Stream<QuerySnapshot<Object?>>? streamallthing;
  bool offer;
  String isactuallyinoffer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 44, 43, 43),
        appBar: AppBar(
          title: Text('Category'),
          backgroundColor: Color.fromARGB(255, 75, 17, 85),
          actions: [
            GestureDetector(
              onTap: () => Get.to(() => AddProduct()),
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(.1),
                  child: Icon(
                    Icons.add,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              )),
            )
          ],
        ),
        body: SafeArea(
            child: StreamBuilder<QuerySnapshot>(
                stream: streamallthing,
                //  FirebaseFirestore.instance
                //     .collection('collection')
                //     .doc('category1')
                //     .collection('category1')
                //     .snapshots()

                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text('something went wrong'));
                  }
                  if (snapshot.hasData) {
                    // final categorylist = snapshot.data!.docs;
                    //print(categorylist);

                    // print(categorylist.length);
                    return ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: ((context, index) {
                        String categorylist = snapshot.data!.docs[index].id;
                        print(snapshot.data!.docs.length);
                        return GestureDetector(
                          onTap: () => Get.to(() => offer == false
                              ? DifferentSizePage(
                                  isactuallyinoffer: isactuallyinoffer,
                                  category: categorylist,
                                )
                              : InSideCategory(
                                  isactuallyinoffer: isactuallyinoffer,
                                  size: 'no',
                                  category: categorylist)),
                          child: Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images.jpeg'),
                              ),
                              title: Text(
                                categorylist.toString(),
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 21, 20, 20)),
                              ),
                            ),
                          ),
                        );
                      }),
                      itemCount: snapshot.data!.docs.length,
                    );

                    //  ListView(
                    //   shrinkWrap: true,
                    //   children: [
                    //     SizedBox(
                    //       height: 20,
                    //     ),
                    //     Center(
                    //       child: Text(
                    //         'varieties',
                    //         style: TextStyle(
                    //             fontSize: 20,
                    //             fontWeight: FontWeight.bold,
                    //             color: Colors.white),
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       height: 20,
                    //     ),

                    //     // ...categorylist.map((value) {
                    //     //   print(value.toString());
                    //     //   log(value[0].toString());
                    //     //   print('ddddd');
                    //     //   return GestureDetector(
                    //     //     onTap: () => Get.to(() => InSideCategory()),
                    //     //     child: Card(
                    //     //       child: ListTile(
                    //     //         leading: CircleAvatar(
                    //     //           backgroundImage:
                    //     //               AssetImage('assets/images.jpeg'),
                    //     //         ),
                    //     //         title: Text(
                    //     //           value[0].toString(),
                    //     //           style: TextStyle(
                    //     //               fontSize: 20,
                    //     //               color: Color.fromARGB(255, 21, 20, 20)),
                    //     //         ),
                    //     //       ),
                    //     //     ),
                    //     //   );
                    //     // }).toList(),
                    //   ],
                    // );
                  } else {
                    return CircularProgressIndicator(
                      color: Colors.black,
                      backgroundColor: Colors.white,
                    );
                  }
                })));
  }
}

Stream<List<ModelProduct>> showTheCategroryList() {
  return FirebaseFirestore.instance
      .collection('collection')
      .doc('category1')
      .collection('category1')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => ModelProduct.fromJson(doc.data()))
          .toList());
}
