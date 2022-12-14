import 'package:adminside/modelclass/ordermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Order extends StatelessWidget {
  const Order({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 82, 34, 82),
        title: Text('Order List'),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Card(
          //     color: Colors.white.withOpacity(.1),
          //     child: ListTile(
          //       contentPadding: EdgeInsets.all(10),
          //       leading: Container(
          //         width: 80,
          //         decoration: BoxDecoration(
          //             image: DecorationImage(
          //                 fit: BoxFit.cover,
          //                 image: AssetImage(
          //                   'assets/goldfish1-2.webp',
          //                 )),
          //             borderRadius: BorderRadius.circular(6)),
          //       ),
          //       title: Text('gold fish'),
          //       subtitle: Text('100ps'),
          //       trailing: Row(
          //         mainAxisSize: MainAxisSize.min,
          //         children: [
          //           Text('100Rs'),
          //           SizedBox(
          //             width: 20,
          //           ),
          //           Icon(
          //             Icons.remove,
          //             color: Colors.black,
          //           )
          //         ],
          //       ),
          //     ),
          //   ),
          // )
          StreamBuilder(
              stream: showTheorderList(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final orderlist = snapshot.data;
                  return Column(
                      children: orderlist!
                          .map((e) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  color: Colors.white.withOpacity(.5),
                                  child: Container(
                                      width: double.infinity,
                                      height: 150,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            height: 120,
                                            width: 120,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(orderlist ==
                                                            null
                                                        ? 'https://img.freepik.com/premium-vector/goldfish-illustration_1366-904.jpg?w=2000'
                                                        : e.imagelist![0]))),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 18),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  orderlist == null
                                                      ? 'Nill'
                                                      : e.name.toString(),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  orderlist == null
                                                      ? '....ps'
                                                      : '${e.minnomultiple.toString()} Ps',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                                Text(
                                                  orderlist == null
                                                      ? '500rs'
                                                      : '${e.subtotalprice.toString()} Rs',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 12),
                                            child: Column(
                                              children: [
                                                ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            backgroundColor:
                                                                Color.fromARGB(
                                                                    255,
                                                                    79,
                                                                    6,
                                                                    6)),
                                                    onPressed: () {
                                                      Reject(e.id);
                                                    },
                                                    child: SizedBox(
                                                        width: 100,
                                                        child: Center(
                                                            child: Text(
                                                                'Reject')))),
                                                khieght,
                                                khieght,
                                                SizedBox(
                                                  height: 7,
                                                ),
                                                ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            backgroundColor:
                                                                Color.fromARGB(
                                                                    255,
                                                                    18,
                                                                    58,
                                                                    91)),
                                                    onPressed: (() {}),
                                                    child: SizedBox(
                                                        width: 100,
                                                        child: Center(
                                                            child: Text(
                                                                'Confirm'))))
                                              ],
                                            ),
                                          )
                                        ],
                                      )),
                                ),
                              ))
                          .toList());
                } else if (snapshot.hasError) {
                  return Text('Some thing went wrong');
                } else {
                  return CircularProgressIndicator();
                }

                ;
              })
        ],
      )),
    );
  }
}

const kwidth = SizedBox(
  width: 10,
);
const khieght = SizedBox(
  height: 10,
);

Stream<List<OrderModel>> showTheorderList() {
  return FirebaseFirestore.instance
      .collection('collection')
      .doc('orders')
      .collection('orderlist')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => OrderModel.fromJson(doc.data())).toList());
}

Reject(String id) async {
  final fireremove = FirebaseFirestore.instance
      .collection('collection')
      .doc('orders')
      .collection('orderlist')
      .doc(id);

  await fireremove
      .delete()
      .then((value) => Get.snackbar('Reject', 'Rejected Successfully'));
}
