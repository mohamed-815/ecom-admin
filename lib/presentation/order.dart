import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.white.withOpacity(.1),
              child: ListTile(
                contentPadding: EdgeInsets.all(10),
                leading: Container(
                  width: 80,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/goldfish1-2.webp',
                          )),
                      borderRadius: BorderRadius.circular(6)),
                ),
                title: Text('gold fish'),
                subtitle: Text('100ps'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('100Rs'),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.remove,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
