import 'dart:developer';

import 'package:adminside/app_module/modelclass/modelclass.dart';
import 'package:adminside/app_module/presentation/offer/offers.dart';
import 'package:adminside/app_module/presentation/prodectside/productadding.dart';
import 'package:adminside/app_module/presentation/widgets/Itemshowingcard.dart';
import 'package:adminside/itemshowingwcreen/itemshowingscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class InSideCategory extends StatelessWidget {
  InSideCategory(
      {required this.isactuallyinoffer,
      required this.size,
      required this.category,
      super.key});
  String size;
  String category;
  String isactuallyinoffer;
  @override
  Widget build(BuildContext context) {
    Stream<List<ModelProduct>> showTheList() {
      return FirebaseFirestore.instance
          .collection('collection')
          .doc('category1')
          .collection('category1')
          .doc(category)
          .collection('itemsize')
          .doc(size)
          .collection(size)
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => ModelProduct.fromJson(doc.data()))
              .toList());
    }

    Stream<List<ModelProduct>> showTheOfferList() {
      return FirebaseFirestore.instance
          .collection('collection')
          .doc('category1')
          .collection('allproducts')
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => ModelProduct.fromJson(doc.data()))
              .toList());
    }

    Stream<List<ModelProduct>> showTheoriginalOfferList() {
      return FirebaseFirestore.instance
          .collection('collection')
          .doc('category1')
          .collection('offerlist')
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => ModelProduct.fromJson(doc.data()))
              .toList());
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 43, 45, 43),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 71, 15, 89),
        title: Text('Items List'),
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
      body: StreamBuilder(
          stream: size != 'no' ? showTheList() : showTheOfferList(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('some thing went wrong');
            }

            if (snapshot.hasData) {
              final showingitems = snapshot.data!;

              // final showingitemsoffers = offerlist
              //     .where((element) => element.category == category)
              //     .toList();

              return size != 'no'
                  ? ListView(
                      children: showingitems
                          .map((e) => MyWidget(
                                size: 'yes',
                                item: e,
                                id: e.id,
                              ))
                          .toList(),
                    )
                  : StreamBuilder(
                      stream: showTheoriginalOfferList(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text('some thing went wrong');
                        }

                        if (snapshot.hasData) {
                          final offerlist = snapshot.data!;
                          final showingitemsoffers = offerlist
                              .where((element) => element.category == category)
                              .toList();

                          return ListView(
                            children: showingitemsoffers
                                .map((e) => MyWidget(
                                      isoffer: 'inoffer',
                                      size: 'no',
                                      item: e,
                                      id: e.id,
                                    ))
                                .toList(),
                          );
                        } else {
                          return CircularProgressIndicator();
                        }
                      });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            // ListView.builder(
            //     itemCount: products.length,
            //     itemBuilder: (context, index) {
            //       final item = products[index];
            //       return MyWidget(item: item);
            //     }

            //     //  MyWidget(item: products)

            //     )
          }),
    );
  }
}
