import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Model {
  String image;
  String price;
  String minno;
  String description;
  String size;
  String itemname;
  Model(
      {required this.description,
      required this.image,
      required this.minno,
      required this.price,
      required this.size,
      required this.itemname});
}

final products = [
  Model(
      description: 'this is good product',
      image: 'assets/goldfish-6029906__480.jpg',
      minno: '100pc',
      price: '10',
      size: 'medium',
      itemname: 'goldfish'),
  Model(
      description: 'this is good product',
      image: 'assets/download.jpeg',
      minno: '100',
      price: '10',
      size: 'medium',
      itemname: 'GoldenBleu'),
  Model(
      description: 'this is good product',
      image: 'assets/download.jpeg',
      minno: '100',
      price: '10',
      size: 'medium',
      itemname: 'Goldenyellow'),
  Model(
      description: 'this is good product',
      image: 'assets/images (1).jpeg',
      minno: '100',
      price: '10',
      size: 'medium',
      itemname: 'Goldenwhite')
];

class ModelProduct {
  // String image;
  String id;
  String category;
  String name;
  String size;
  String price;
  String minno;
  String description;
  List<dynamic>? imagelist = [];

  ModelProduct({
    this.imagelist,
    // required this.imagelist,
    this.id = '',
    required this.description,
    //  required this.image,
    required this.name,
    required this.category,
    required this.minno,
    required this.price,
    required this.size,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category': category,
      'name': name,
      'size': size,
      'price': price,
      'minno': minno,
      'description': description,
      'imagelist': imagelist,
    };
  }

  static ModelProduct fromJson(Map<String, dynamic> json) {
    return ModelProduct(
      id: json['id'],
      description: json['description'],
      name: json['name'],
      category: json['category'],
      minno: json['minno'],
      price: json['price'],
      size: json['size'],
      imagelist: json['imagelist'],
    );
  }
}

Stream<List<ModelProduct>> showTheList() {
  return FirebaseFirestore.instance.collection('category').snapshots().map(
      (snapshot) => snapshot.docs
          .map((doc) => ModelProduct.fromJson(doc.data()))
          .toList());
}
