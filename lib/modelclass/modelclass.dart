import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ModelProduct {
  // String image;
  String offer;
  String id;
  String category;
  String name;
  String size;
  double price;
  double minno;
  String description;
  List<dynamic>? imagelist = [];

  ModelProduct({
    required this.offer,
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
      'offer': offer,
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
      offer: json['offer'],
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
  return FirebaseFirestore.instance
      .collection('collection')
      .doc('category1')
      .collection('accessories')
      .doc('itemsize')
      .collection('large')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => ModelProduct.fromJson(doc.data()))
          .toList());
}
