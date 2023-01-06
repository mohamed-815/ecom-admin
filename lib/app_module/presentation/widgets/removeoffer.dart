import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RemoveDialog extends StatelessWidget {
  RemoveDialog({required this.funtion1, super.key});

  DocumentReference<Map<String, dynamic>> funtion1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 121, 113, 122),
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                ),
                onPressed: () async {
                  await funtion1.delete().whenComplete(() => print(
                      '=========================================================='));
                  Get.back();
                },
                child: OfferRemoveText(
                  data: 'Remove',
                )),
            SizedBox(
              width: 9,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 121, 113, 122),
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                ),
                onPressed: () {
                  Get.back();
                },
                child: OfferRemoveText(
                  data: 'cancel',
                ))
          ],
        )
      ],
    );
  }
}

class RemoveofferDialog extends StatelessWidget {
  RemoveofferDialog({required this.funtion1, super.key});

  DocumentReference<Map<String, dynamic>> funtion1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
                onPressed: () async {
                  Get.back();
                },
                child: OfferRemoveText(
                  data: 'Edit',
                )),
            TextButton(
                onPressed: () async {
                  await funtion1.delete();
                  Get.back();
                },
                child: OfferRemoveText(
                  data: 'Remove',
                )),
            SizedBox(
              width: 9,
            ),
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: OfferRemoveText(
                  data: 'cancel',
                ))
          ],
        )
      ],
    );
  }
}

class OfferRemoveText extends StatelessWidget {
  OfferRemoveText({
    required this.data,
    Key? key,
  }) : super(key: key);
  String data;
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(color: Colors.white),
    );
  }
}
