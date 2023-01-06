import 'package:adminside/app_module/modelclass/modelclass.dart';
import 'package:adminside/app_module/presentation/user/order.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Userside extends StatelessWidget {
  const Userside({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 61, 55, 75),
      ),
      body: ListView(children: <Widget>[
        khieght,
        khieght,
        khieght,
        Center(
            child: Text(
          'Users',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        )),
        khieght,
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              rowNew(data1: 'No', data2: "Email"),
              Divider(),
              StreamBuilder(
                  stream: showTheusers(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Some Thing Wrong');
                    }
                    if (snapshot.hasData) {
                      final list = snapshot.data;
                      ListView.separated(
                          itemBuilder: ((context, index) {
                            final data = list[index];
                            return rowNew(data1: index.toString(), data2: data);
                          }),
                          separatorBuilder: ((context, index) {
                            return Divider();
                          }),
                          itemCount: list!.length);
                    }
                    return CircularProgressIndicator();
                  })
            ])),
      ]),
    );
  }
}

class rowNew extends StatelessWidget {
  rowNew({
    required this.data1,
    required this.data2,
    Key? key,
  }) : super(key: key);

  String data1;
  String data2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          data1,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          data2,
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class UserHeads extends StatelessWidget {
  UserHeads({
    required this.title,
    Key? key,
  }) : super(key: key);

  String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}

Stream<List<dynamic>> showTheusers() {
  return FirebaseFirestore.instance
      .collection('collection')
      .doc('users')
      .collection('users')
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) => doc['name']).toList());
}
