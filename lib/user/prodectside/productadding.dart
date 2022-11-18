import 'dart:ffi';
import 'dart:io';

import 'package:adminside/user/prodectside/modelclass.dart';
import 'package:adminside/user/prodectside/productsidecontroller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:image_picker/image_picker.dart';

List<String> differentsizes = ['Small', 'Meadium', 'Large'];
String item = '';
ProductAddingController pa = Get.put(ProductAddingController());

class AddProduct extends StatelessWidget {
  AddProduct({this.editproduct, this.id, this.isedited, super.key});

  bool? isedited = false;
  String? id;
  ModelProduct? editproduct;
  String? category = '';
  String? size = '';
  List<dynamic>? images;

  final namecontroller = TextEditingController();
  final pricecontroller = TextEditingController();
  final descriptioncontroller = TextEditingController();
  //final categorycontroller = TextEditingController();
  final minpurchasecontroller = TextEditingController();

  final dropdowncontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (editproduct != null) {
      namecontroller.text = editproduct!.name;
      pricecontroller.text = editproduct!.price;
      descriptioncontroller.text = editproduct!.description;
      minpurchasecontroller.text = editproduct!.minno;
      category = editproduct!.category;
      size = editproduct!.size;
      pa.dropdownvaleu.value = editproduct!.size;
      pa.dropcategory.value = editproduct!.category;
    }

    final screenWidth = MediaQuery.of(context).size.width * 0.95;

    //log('reloaded');
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 43, 45, 43),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 75, 17, 85),
        title: const Text(
          'Add New Product',
          style: TextStyle(color: Color.fromARGB(255, 222, 231, 223)),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(children: [
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 40,
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => DropdownButtonFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 208, 212, 208), width: 1),
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(255, 43, 45, 43),
                ),
                dropdownColor: Color.fromARGB(255, 43, 45, 43),
                value: pa.dropcategory.value,
                onChanged: (newValue) {
                  pa.onchangeCategory(newValue);
                },
                items: <String>[
                  'Feeds',
                  'Aquarium',
                  'Edible Seeds',
                  'Birds',
                  'Accessories',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            textfield1(hint: 'Name of the Product', controller: namecontroller),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => DropdownButtonFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 208, 212, 208), width: 1),
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(255, 43, 45, 43),
                ),
                dropdownColor: Color.fromARGB(255, 43, 45, 43),
                value: pa.dropdownvaleu.value,
                onChanged: (newValue) {
                  pa.onchange(newValue);
                },
                items: <String>[
                  'Small',
                  'Medium',
                  'Large',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                textfield1(
                    hint: 'Price',
                    keybord: TextInputType.number,
                    controller: pricecontroller),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            textfield1(
                hint: 'Min No Of Purchase', controller: minpurchasecontroller),
            const SizedBox(
              height: 20,
            ),
            textfield1(
              hint: 'Description',
              lines: 5,
              controller: descriptioncontroller,
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => pa.imagePath!.value != ''
                  ? Container(
                      height: 240,
                      child: ListView.builder(
                          itemCount: pa.imagelist!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, intex) {
                            String image1 = pa.imagelist![intex];

                            return CircleAvatar(
                              backgroundColor: Colors.purple.shade700,
                              radius: 100,
                              child: ClipOval(
                                child: Image.file(
                                  File(image1),
                                  width: 180,
                                  height: 180,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }),
                    )
                  : Container(),
            ),
            GestureDetector(
              onTap: () => pa.getImage(source: ImageSource.gallery),
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
                    if (namecontroller.text.isNotEmpty &&
                        pa.dropcategory.isNotEmpty &&
                        pa.dropdownvaleu.isNotEmpty &&
                        pricecontroller.text.isNotEmpty &&
                        minpurchasecontroller.text.isNotEmpty &&
                        descriptioncontroller.text.isNotEmpty) {
                      final productdetail = ModelProduct(
                        imagelist: pa.imagelist,
                        description: descriptioncontroller.text,
                        name: namecontroller.text,
                        category: pa.dropcategory.value,
                        minno: minpurchasecontroller.text,
                        price: pricecontroller.text,
                        size: pa.dropdownvaleu.value,
                      );

                      if (editproduct == null) {
                        addNewiintofireBase(productdetail);
                      } else {
                        var collection = FirebaseFirestore.instance
                            .collection('collection')
                            .doc(id);

                        final json = productdetail.toJson();
                        await collection.set(json
                            //, SetOptions(merge: true)
                            );
                      }

                      Get.back();
                    } else {
                      Get.snackbar(
                        'AddingDetail',
                        'message',
                        titleText: Text('Adding detail'),
                        messageText: Text('Please fill it'),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      textStyle: const TextStyle(fontSize: 20),
                      backgroundColor: Color.fromARGB(255, 104, 108, 104)),
                  child: const Text('  Done  '),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
          ])),
    );
  }
}

Row textfield1({
  int lines = 1,
  String hint = '',
  TextInputType keybord = TextInputType.text,
  required TextEditingController controller,
  double fieldWidth = 370,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        width: fieldWidth,
        child: TextFormField(
          controller: controller,
          keyboardType: keybord,
          minLines: lines,
          maxLines: 10,
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
                hint,
                style: const TextStyle(color: Colors.white70),
              ),
              hintStyle: const TextStyle(color: Colors.white70)),
        ),
      ),
    ],
  );
}

addNewiintofireBase(ModelProduct productdetail) async {
  final addingtofirebase =
      FirebaseFirestore.instance.collection('category').doc();
  productdetail.id = addingtofirebase.id;
  final json = productdetail.toJson();
  await addingtofirebase.set(json);
  if (pa.imagelist != null) {
    pa.imagelist!.clear();
  }
  if (pa.imagePath != '') {
    pa.imagePath!.value = '';
  }
}
