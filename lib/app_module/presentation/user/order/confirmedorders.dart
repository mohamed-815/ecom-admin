import 'package:adminside/app_module/modelclass/ordermodel.dart';
import 'package:adminside/app_module/presentation/user/order.dart';
import 'package:adminside/app_module/presentation/user/order/location.dart';
import 'package:adminside/app_module/presentation/user/order/locmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ConfirmedOrders extends StatelessWidget {
  const ConfirmedOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Center(child: Text20black(data: 'Confirmed Order')),
          StreamOrder(data: 'yes')
        ],
      ),
    );
  }
}

StreamBuilder<List<OrderModel>> StreamOrder({required String data}) {
  return StreamBuilder(
      stream: showTheorderList(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<OrderModel> confirmorders = [];
          final orderlist = snapshot.data;
          if (data == '') {
            confirmorders = orderlist!
                .where((element) => element.orderstatus == null)
                .toList();
          } else {
            confirmorders = orderlist!
                .where((element) => element.orderstatus == data)
                .toList();
          }

          print(confirmorders);
          return confirmorders != null
              ? Column(
                  children: confirmorders
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
                                        padding: const EdgeInsets.only(top: 18),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 100.w,
                                              child: Text(
                                                orderlist == null
                                                    ? 'Nill'
                                                    : e.name.toString(),
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Text(
                                              orderlist == null
                                                  ? '....ps'
                                                  : '${e.minnomultiple.toString()} Ps',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                            Text(
                                              orderlist == null
                                                  ? '500rs'
                                                  : '${e.subtotalprice.toString()} Rs',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w300),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 12),
                                        child: Column(
                                          children: [
                                            e.orderstatus == 'yes' ||
                                                    e.orderstatus == null
                                                ? buttonNew(
                                                    color1: Color.fromARGB(
                                                        255, 9, 39, 63),
                                                    data: 'Reject',
                                                    onpress: () {
                                                      updateStatus(
                                                          id: e.id,
                                                          odreritem: e,
                                                          status: 'no');
                                                    },
                                                  )
                                                : buttonNew(
                                                    color1: Colors.green,
                                                    data: 'Rejected (✓)',
                                                    onpress: () {},
                                                  ),
                                            khieght,
                                            khieght,
                                            SizedBox(
                                              height: 7,
                                            ),
                                            e.orderstatus == null ||
                                                    e.orderstatus == 'no'
                                                ? buttonNew(
                                                    color1: Color.fromARGB(
                                                        255, 9, 39, 63),
                                                    data: 'Confirm',
                                                    onpress: () {
                                                      Get.defaultDialog(
                                                          content: ProfileShow(
                                                              odreritem: e,
                                                              profiledetail:
                                                                  LocationDetail
                                                                      .fromJson(
                                                                          e.locationdetail!)));
                                                    },
                                                  )
                                                : buttonNew(
                                                    color1: Colors.green,
                                                    data: 'Confirmed (✓)',
                                                    onpress: () {},
                                                  )
                                          ],
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                          ))
                      .toList())
              : Center(child: Text20black(data: 'Nothing Here'));
        } else if (snapshot.hasError) {
          return Text('Some thing went wrong');
        } else {
          return CircularProgressIndicator();
        }

        ;
      });
}
