import 'package:adminside/app_module/presentation/user/order.dart';
import 'package:adminside/app_module/presentation/user/order/confirmedorders.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class RejectedOrders extends StatelessWidget {
  const RejectedOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Center(child: Text20black(data: 'Rejected Order')),
          StreamOrder(data: 'no')
        ],
      ),
    );
  }
}
