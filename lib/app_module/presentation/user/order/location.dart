import 'package:adminside/app_module/modelclass/ordermodel.dart';
import 'package:adminside/app_module/presentation/user/order.dart';
import 'package:adminside/app_module/presentation/user/order/locmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileShow extends StatelessWidget {
  ProfileShow(
      {required this.odreritem, required this.profiledetail, super.key});
  OrderModel odreritem;
  LocationDetail profiledetail;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        khieght,
        Center(
            child: Text(
                profiledetail == null ? 'Enter place' : profiledetail.place,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                ))),
        khieght,
        ProfileDetailLine(
          Name1: 'mob : ',
          Name2: profiledetail == null ? 'mobile no' : profiledetail.mobileno,
        ),
        khieght,
        ProfileDetailLine(
            Name1: 'City : ',
            Name2: profiledetail == null ? 'City' : profiledetail.city),
        khieght,
        ProfileDetailLine(
          Name1: 'Location : ',
          Name2: profiledetail == null ? 'Location' : profiledetail.district,
        ),
        khieght,
        buttonNew(
          color1: Colors.green,
          data: 'Confirm',
          onpress: () {
            updateStatus(id: odreritem.id, odreritem: odreritem, status: 'yes');
            Get.back();
          },
        )
      ],
    );
  }
}

class ProfileDetailLine extends StatelessWidget {
  ProfileDetailLine({
    required this.Name1,
    required this.Name2,
    Key? key,
  }) : super(key: key);
  String Name1;
  String Name2;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(Name1,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 20,
            )),
        Text(Name2,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 20,
            )),
      ],
    ));
  }
}
