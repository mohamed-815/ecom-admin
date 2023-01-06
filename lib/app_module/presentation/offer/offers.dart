import 'package:adminside/app_module/modelclass/modelclass.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Offers extends StatelessWidget {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: ListView(
        children: [
          Column(
            children: [
              Center(
                  child:
                      Title(color: Colors.white, child: const Text('Offers'))),
              Builder(builder: (context) {
                return Column(
                  children: const [],
                );
              })
            ],
          )
        ],
      )),
    );
  }
}

Stream<List<ModelProduct>> OfferListStream() {
  return FirebaseFirestore.instance
      .collection('collection')
      .doc('category1')
      .collection('allproducts')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => ModelProduct.fromJson(doc.data()))
          .toList());
}
