import 'dart:developer';
import 'dart:ffi';
import 'dart:io';

import 'package:adminside/app_module/modelclass/modelclass.dart';
import 'package:adminside/app_module/controller/productsidecontroller.dart';
import 'package:adminside/app_module/presentation/widgets/radiobutton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:image_picker/image_picker.dart';

List<String> differentsizes = ['Small', 'Meadium', 'Large'];
String item = '';
ProductAddingController pa = Get.put(
  ProductAddingController(),
);
final FocusNode namefocus = FocusNode();
final FocusNode pricefocus = FocusNode();
final FocusNode describefocus = FocusNode();
final FocusNode minpurchasefocus = FocusNode();
final FocusNode categoryfocus = FocusNode();
final FocusNode sizefocus = FocusNode();

class AddProduct extends StatelessWidget {
  AddProduct(
      {this.isoffer, this.editproduct, this.id, this.isedited, super.key});
  String? isoffer;
  bool? isedited = false;
  String? id;
  ModelProduct? editproduct;
  String? category = '';
  String? size = '';
  List<dynamic>? images;

  // TextEditingController namecontroller = TextEditingController();
  // TextEditingController pricecontroller = TextEditingController();
  // TextEditingController descriptioncontroller = TextEditingController();

  // TextEditingController minpurchasecontroller = TextEditingController();

  final dropdowncontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (editproduct != null) {
        //   print(id);
        //    print(editproduct!.toJson());
        pa.editPage(editproduct);

        // namecontroller.text = editproduct!.name;
        // pricecontroller.text = editproduct!.price;
        // descriptioncontroller.text = editproduct!.description;
        // minpurchasecontroller.text = editproduct!.minno;
        // category = editproduct!.category;
        // size = editproduct!.size;
        // pa.dropdownvaleu.value = editproduct!.size;
        // pa.dropcategory.value = editproduct!.category;
      }
    });

    final screenWidth = MediaQuery.of(context).size.width * 0.95;

    //log('reloaded');
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 43, 45, 43),
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Get.back();
              pa.clearController();
            },
            child: Icon(Icons.arrow_back)),
        backgroundColor: Color.fromARGB(255, 75, 17, 85),
        title: const Text(
          'Add New Product',
          style: TextStyle(color: Color.fromARGB(255, 222, 231, 223)),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetX<ProductAddingController>(
              init: ProductAddingController(),
              builder: (c) {
                return ListView(children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  id == null
                      ? DropdownButtonFormField(
                          hint: id == null
                              ? Text('Category')
                              : Text(c.dropcategoryname1.value),
                          focusNode: categoryfocus,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 208, 212, 208),
                                  width: 1),
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(255, 43, 45, 43),
                          ),
                          dropdownColor: Color.fromARGB(255, 43, 45, 43),
                          value: c.dropcategory.value,
                          onChanged: (newValue) {
                            c.onchangeCategory(newValue);
                          },
                          items: <String>[
                            'feeds',
                            'aquarium',
                            'edibleseeds',
                            'birds',
                            'accessories',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            );
                          }).toList(),
                        )
                      : SizedBox(),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField1(
                      hint: id == null ? 'Name of the Product' : c.name1.value,
                      controller: c.textEditingControllername.value),
                  const SizedBox(
                    height: 20,
                  ),
                  id == null
                      ? DropdownButtonFormField(
                          hint: id == null
                              ? Text('size')
                              : Text(c.dropsizename1.value),
                          focusNode: sizefocus,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 208, 212, 208),
                                  width: 1),
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(255, 43, 45, 43),
                          ),
                          dropdownColor: Color.fromARGB(255, 43, 45, 43),
                          value: c.dropdownvaleu.value,
                          onChanged: (newValue) {
                            c.onchange(newValue);
                          },
                          items: <String>[
                            'small',
                            'medium',
                            'large',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            );
                          }).toList(),
                        )
                      : SizedBox(),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextField1(
                          hint:
                              id == null ? 'Price' : c.price1.value.toString(),
                          keybord: TextInputType.number,
                          controller: c.textEditingControllerprice.value),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField1(
                      hint: id == null
                          ? 'Min No Of Purchase'
                          : c.minno1.value.toString(),
                      controller: c.textEditingControllerminno.value),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField1(
                    hint: id == null ? 'Description' : c.describe1.value,
                    lines: 5,
                    controller: c.textEditingControllerdescribe.value,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  isoffer != 'inoffer'
                      ? Card(
                          color: Colors.white.withOpacity(.1),
                          child: ListTile(
                            title: OfeerText(name: 'No Offer'),
                            trailing: radioButton(
                                value: 'nooffer',
                                onChange: (value) {
                                  c.offerChanging(value);
                                }),
                          ),
                        )
                      : SizedBox(),
                  isoffer != 'inoffer'
                      ? Card(
                          color: Colors.white.withOpacity(.1),
                          child: ListTile(
                            title: OfeerText(name: 'Put In Offer'),
                            trailing: radioButton(
                                value: 'putinoffer',
                                onChange: (value) {
                                  c.offerChanging(value);
                                }),
                          ),
                        )
                      : SizedBox(),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(255, 71, 73, 71),
                            spreadRadius: 3),
                      ],
                    ),
                    child: c.imagePath!.value != ''
                        ? Container(
                            height: 240,
                            child: ListView.builder(
                                itemCount: c.imagelist!.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, intex) {
                                  String image1 = c.imagelist![intex];

                                  return CircleAvatar(
                                      backgroundColor:
                                          Colors.white.withOpacity(.1),
                                      radius: 100,
                                      child: Image.network(
                                        image1,
                                        fit: BoxFit.cover,
                                      ));
                                }),
                          )
                        : Container(),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () => c.getImage(source: ImageSource.gallery),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage('assets/images.png'))),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          if (id == null) {
                            c.productadd();
                          } else {
                            print(size);
                            isoffer != 'inoffer'
                                ? c.productEdit(
                                    offer: 'no',
                                    id: id,
                                    category: editproduct?.category,
                                    size: editproduct?.size)
                                : c.productEdit(
                                    offer: 'inoffer',
                                    id: id,
                                    category: editproduct?.category,
                                    size: editproduct?.size);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            textStyle: const TextStyle(fontSize: 20),
                            backgroundColor:
                                Color.fromARGB(255, 104, 108, 104)),
                        child: const Text('  Done  '),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ]);
              })),
    );
  }
}

class OfeerText extends StatelessWidget {
  OfeerText({
    required this.name,
    Key? key,
  }) : super(key: key);

  String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(color: Colors.white),
    );
  }
}

class TextField1 extends StatefulWidget {
  TextField1(
      {required this.controller,
      this.fieldWidth = 370,
      this.hint = '',
      this.keybord = TextInputType.text,
      this.lines = 1,
      super.key});

  int lines;
  String hint;
  TextInputType keybord;
  TextEditingController controller;
  double fieldWidth;

  @override
  State<TextField1> createState() => _TextField1State();
}

class _TextField1State extends State<TextField1> {
  @override
  Widget build(BuildContext context) {
    // void EditingComplete() {
    //   FocusScope.of(context).requestFocus(widget.focusnode2);
    // }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: widget.fieldWidth,
          child: TextFormField(
            // focusNode: widget.focusnode,
            controller: widget.controller,
            keyboardType: widget.keybord,
            minLines: widget.lines,
            maxLines: 10,
            // onChanged: (value) {
            //   widget.controller.text = value;
            // },
            //textAlign: TextAlign.start,
            style: const TextStyle(color: Colors.white, fontSize: 16),
            decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 106, 110, 107), width: 1.0),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white60, width: 1.0),
                ),
                label: Text(
                  widget.hint,
                  style: const TextStyle(color: Colors.white70),
                ),
                hintStyle: const TextStyle(color: Colors.white70)),
            // onEditingComplete: EditingComplete,
          ),
        ),
      ],
    );
  }
}

// Row textfield1({
//   int lines = 1,
//   String hint = '',
//   TextInputType keybord = TextInputType.text,
//   required TextEditingController controller,
//   double fieldWidth = 370,
// }) {}

Future<void> addNewiintofireBase(ModelProduct productdetail) async {
  print('.........................................................opened');

  final addingtofirebase = FirebaseFirestore.instance
      .collection('collection')
      .doc('category1')
      .collection('category1')
      .doc(productdetail.category)
      .collection('itemsize')
      .doc(productdetail.size)
      .collection(productdetail.size)
      .doc();

  final addingtototalproducts = FirebaseFirestore.instance
      .collection('collection')
      .doc('category1')
      .collection('allproducts')
      .doc();

  if (productdetail.offer == 'putinoffer') {
    final addingtoffer = FirebaseFirestore.instance
        .collection('collection')
        .doc('category1')
        .collection('offerlist')
        .doc();

    await addingtofirebaseacount(
            id: addingtoffer.id,
            addingtocloud: addingtoffer,
            productdetail: productdetail)
        .whenComplete(() => print('Added to OfferList.............'));
  }

  await addingtofirebaseacount(
          id: addingtototalproducts.id,
          addingtocloud: addingtototalproducts,
          productdetail: productdetail)
      .whenComplete(() => print('Added to Totallist..............'));

  await addingtofirebaseacount(
          id: addingtofirebase.id,
          addingtocloud: addingtofirebase,
          productdetail: productdetail)
      .whenComplete(() => print('Added to crorectsize..............'));

  // productdetail.id = addingtofirebase.id;
  // final json = productdetail.toJson();
  // await addingtofirebase.set(json).then((value) => json['imagelist']);

  final adtocollection = FirebaseFirestore.instance
      .collection('collection')
      .doc('category1')
      .collection('category1')
      .doc(productdetail.category);
  await adtocollection.set({'name': productdetail.category});

  final adtosize = FirebaseFirestore.instance
      .collection('collection')
      .doc('category1')
      .collection('category1')
      .doc(productdetail.category)
      .collection('itemsize')
      .doc(productdetail.size);
  await adtosize.set({'name': productdetail.size});

  if (pa.imagelist != null) {
    pa.imagelist!.clear();
  }
  if (pa.imagePath != '') {
    pa.imagePath!.value = '';
  }
}

Future<void> addingEditedThings(String id, ModelProduct productdetail) async {
  print(id);

  var a = await FirebaseFirestore.instance
      .collection('collection')
      .doc('category1')
      .collection('category1')
      .doc(productdetail.category)
      .collection('itemsize')
      .doc(productdetail.size)
      .collection(productdetail.size)
      .doc(id)
      .get();

  productdetail.id = a.id;
  // await collection.delete();
  Map<String, dynamic> json = productdetail.toJson();
  if (a.exists) {
    final DocumentReference documentReference = FirebaseFirestore.instance
        .collection('collection')
        .doc('category1')
        .collection('category1')
        .doc(productdetail.category)
        .collection('itemsize')
        .doc(productdetail.size)
        .collection(productdetail.size)
        .doc(id);
    return await documentReference.update(json);
  } else {
    final DocumentReference documentReference = FirebaseFirestore.instance
        .collection('collection')
        .doc('category1')
        .collection('category1')
        .doc(productdetail.category)
        .collection('itemsize')
        .doc(productdetail.size)
        .collection(productdetail.size)
        .doc(id);
    return await documentReference.set(json);
  }
  // final collection = FirebaseFirestore.instance.collection('category').doc(id);

  // productdetail.id = collection.id;
  // // await collection.delete();
  // final json = productdetail.toJson();
  // print('this is jason new');

  // await collection.update(json).whenComplete(() => print(' updated'));
  // print(json);

  // if (pa.imagelist != null) {
  //   pa.imagelist!.clear();
  // }
  // if (pa.imagePath != '') {
  //   pa.imagePath!.value = '';
  // }
}

Future<void> addingEditedThingsoffer(
    String id, ModelProduct productdetail) async {
  print(id);

  var a = await FirebaseFirestore.instance
      .collection('collection')
      .doc('category1')
      .collection('offerlist')
      .doc(id)
      .get();

  productdetail.id = a.id;
  // await collection.delete();
  Map<String, dynamic> json = productdetail.toJson();
  if (a.exists) {
    final DocumentReference documentReference = FirebaseFirestore.instance
        .collection('collection')
        .doc('category1')
        .collection('offerlist')
        .doc(id);
    return await documentReference.update(json);
  } else {
    final DocumentReference documentReference = FirebaseFirestore.instance
        .collection('collection')
        .doc('category1')
        .collection('offerlist')
        .doc(id);
    return await documentReference.set(json);
  }
  // final collection = FirebaseFirestore.instance.collection('category').doc(id);

  // productdetail.id = collection.id;
  // // await collection.delete();
  // final json = productdetail.toJson();
  // print('this is jason new');

  // await collection.update(json).whenComplete(() => print(' updated'));
  // print(json);

  // if (pa.imagelist != null) {
  //   pa.imagelist!.clear();
  // }
  // if (pa.imagePath != '') {
  //   pa.imagePath!.value = '';
  // }
}

Future<void> addingtofirebaseacount(
    {required String id,
    required DocumentReference<Map<String, dynamic>> addingtocloud,
    required ModelProduct productdetail}) async {
  productdetail.id = id;
  final json2 = productdetail.toJson();
  await addingtocloud.set(json2);
  // log(json2['imagelist']);
}
