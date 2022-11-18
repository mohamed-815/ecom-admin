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
        Center(
            child: Text(
          'Users',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DataTable(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 10)),
            horizontalMargin: 10,
            columnSpacing: 25,
            dividerThickness: 5,
            columns: [
              DataColumn(
                  label: Text('no',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Name',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('Stephen')),
              ]),
              DataRow(cells: [
                DataCell(Text('2')),
                DataCell(Text('John')),
              ]),
              DataRow(cells: [
                DataCell(Text('3')),
                DataCell(Text('Harry')),
              ]),
              DataRow(cells: [
                DataCell(Text('4')),
                DataCell(Text('Peter')),
              ]),
            ],
          ),
        ),
      ]),
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
