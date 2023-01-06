import 'package:adminside/app_module/modelclass/ordermodel.dart';
import 'package:adminside/app_module/presentation/user/order/confirmedorders.dart';
import 'package:adminside/app_module/presentation/user/order/rejectedorder.dart';
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
          khieght,
          khieght,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () async {
                  await showGeneralDialog(
                      context: context,
                      barrierDismissible: true,
                      barrierLabel: MaterialLocalizations.of(context)
                          .modalBarrierDismissLabel,
                      barrierColor: Color.fromARGB(115, 24, 22, 22),
                      transitionDuration: const Duration(milliseconds: 500),
                      pageBuilder: (BuildContext buildContext,
                          Animation animation, Animation secondaryAnimation) {
                        return Center(
                          child: Container(
                              color: Colors.white,
                              height: 600,
                              child: RejectedOrders()),
                        );
                      });
                },
                child: CardOrder(
                  data: 'Rejected\nOrders     ',
                ),
              ),
              GestureDetector(
                  onTap: () async {
                    await showGeneralDialog(
                        context: context,
                        barrierDismissible: true,
                        barrierLabel: MaterialLocalizations.of(context)
                            .modalBarrierDismissLabel,
                        barrierColor: Color.fromARGB(115, 24, 22, 22),
                        transitionDuration: const Duration(milliseconds: 500),
                        pageBuilder: (BuildContext buildContext,
                            Animation animation, Animation secondaryAnimation) {
                          return Center(
                            child: Container(
                                color: Colors.white,
                                height: 600,
                                child: ConfirmedOrders()),
                          );
                        });
                  },
                  child: CardOrder(data: 'Confirmed\nOrders'))
            ],
          ),
          khieght,
          khieght,
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
          Center(
            child: Text20black(
              data: 'New Orders',
            ),
          ),

          StreamOrder(data: '')
        ],
      )),
    );
  }
}

class CardOrder extends StatelessWidget {
  CardOrder({
    required this.data,
    Key? key,
  }) : super(key: key);
  String data;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 9, 39, 63),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text20(data: data),
      ),
    );
  }
}

class Text20 extends StatelessWidget {
  const Text20({
    Key? key,
    required this.data,
  }) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
          fontSize: 20,
          color: Color.fromARGB(255, 230, 223, 223),
          fontWeight: FontWeight.bold),
    );
  }
}

class Text20black extends StatelessWidget {
  const Text20black({
    Key? key,
    required this.data,
  }) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
          fontSize: 20,
          color: Color.fromARGB(255, 23, 22, 22),
          fontWeight: FontWeight.bold),
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

updateStatus(
    {required String id,
    required OrderModel odreritem,
    required String status}) async {
  final firereedit = FirebaseFirestore.instance
      .collection('collection')
      .doc('orders')
      .collection('orderlist')
      .doc(id);

  odreritem.orderstatus = status;
  final json = odreritem.toJson();

  await firereedit.set(json).then((value) => odreritem.orderstatus == 'no'
      ? Get.snackbar('Remove', 'Remove Successfully')
      : Get.snackbar('Confirm', ' Successfully Confirmed'));
}

class buttonNew extends StatelessWidget {
  buttonNew({
    required this.color1,
    required this.data,
    this.onpress,
    Key? key,
  }) : super(key: key);
  void Function()? onpress;
  String data;
  Color color1;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: color1),
        onPressed: onpress,
        child: SizedBox(
            width: 100, child: Center(child: Text(data == null ? '' : data))));
  }
}
