import 'package:adminside/app_module/modelclass/modelclass.dart';
import 'package:adminside/app_module/presentation/widgetscommon/heading.dart';
import 'package:flutter/material.dart';

class PcCard extends StatelessWidget {
  PcCard({
    required this.itemdetail,
    this.feed,
    required this.title,
    Key? key,
  }) : super(key: key);
  String? feed;
  String title;
  ModelProduct itemdetail;

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: const Color.fromRGBO(23, 22, 22, 1),
        child: Container(
            margin: const EdgeInsets.all(10),
            child: smalltextboldWidjets9(
              Title: itemdetail.category != 'feeds'
                  ? '1 ps @ ${title} Rs'
                  : '1 Kg @ ${title} Rs',
            )));
  }
}

class Pccardadd extends StatelessWidget {
  Pccardadd({
    required this.title,
    Key? key,
  }) : super(key: key);
  String title;
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        color: const Color.fromRGBO(23, 22, 22, 1),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //   Icon(Icons.add, size: 20),
              Container(
                  margin: const EdgeInsets.all(10),
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  )),
              //  Icon(Icons.remove, size: 15),
            ],
          ),
        ));
  }
}

class CardAddCart extends StatelessWidget {
  CardAddCart({
    required this.title,
    Key? key,
  }) : super(key: key);
  String title;
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        color: const Color.fromARGB(255, 31, 29, 29),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: const EdgeInsets.all(10),
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
            ],
          ),
        ));
  }
}
