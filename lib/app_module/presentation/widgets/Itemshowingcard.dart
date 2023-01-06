import 'package:adminside/app_module/modelclass/modelclass.dart';

import 'package:adminside/app_module/presentation/prodectside/productadding.dart';
import 'package:adminside/app_module/presentation/widgets/removeoffer.dart';
import 'package:adminside/itemshowingwcreen/itemshowingscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyWidget extends StatelessWidget {
  MyWidget(
      {this.isoffer,
      required this.size,
      required this.item,
      required this.id,
      super.key});
  ModelProduct item;
  String? isoffer;
  String size;
  String id;
  DocumentReference<Map<String, dynamic>>? deletdoc;

  DocumentReference<Map<String, dynamic>> Getingthedelete() {
    return deletdoc = FirebaseFirestore.instance
        .collection('collection')
        .doc('category1')
        .collection('category1')
        .doc(item.category)
        .collection('itemsize')
        .doc(item.size)
        .collection(item.size)
        .doc(id);
  }

  DocumentReference<Map<String, dynamic>> Getingthedeleteoffer() {
    return deletdoc = FirebaseFirestore.instance
        .collection('collection')
        .doc('category1')
        .collection('offerlist')
        .doc(id);
  }

  ModelProduct? editproduct;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(ItemShowingScreen(itemdetail: item));
      },
      child: Card(
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () async {
                    // await tapeToedit(id).then((value) =>

                    Get.to(() => AddProduct(
                          isoffer: isoffer,
                          id: id,
                          editproduct: item,
                        ));

                    //);
                  },
                  child: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(.2),
                      child: Icon(
                        Icons.edit,
                        color: Colors.black,
                      )),
                ),
                GestureDetector(
                  onTap: () async {
                    isoffer != 'inoffer'
                        ? Get.defaultDialog(
                            content: RemoveDialog(funtion1: Getingthedelete()))
                        : Get.defaultDialog(
                            content:
                                RemoveDialog(funtion1: Getingthedeleteoffer()));
                  },
                  child: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(.2),
                      child: Icon(
                        Icons.delete,
                        color: Colors.black,
                      )),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.all(8),
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        image: NetworkImage(item.imagelist!.isEmpty
                            //     ||
                            // item.imagelist![1].toString() == null
                            ? 'https://www.freeiconspng.com/thumbs/no-image-icon/no-image-icon-6.png'
                            : item.imagelist![0].toString()),
                      ),
                    ),
                  )
                  // : Image.asset(
                  //     height: 150,
                  //     width: 150,
                  //     'assets/goldfish1-2.webp',
                  //     fit: BoxFit.cover,
                  //   ),,
                  ,
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Item Name : ',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          Container(
                            width: 100.w,
                            child: Text(
                              item.name,
                              style: const TextStyle(
                                  fontSize: 15,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Item Price :',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            item.price.toString(),
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Item Size : ',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            item.size,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Min Nos: ',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            item.minno.toString(),
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'description : ',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          Container(
                            width: 40,
                            child: Text(
                              item.description,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  //    Model(description: description, image: image, minno: minno, price: price, size: size)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> tapeToDelete(id) {
    return FirebaseFirestore.instance
        .collection('collection')
        .doc('category1')
        .collection('category1')
        .doc(item.category)
        .collection('itemsize')
        .doc(item.size)
        .collection(item.size)
        .doc(id)
        .delete();
  }
}
