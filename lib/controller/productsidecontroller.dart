import 'dart:io';
import 'package:adminside/presentation/prodectside/modelclass.dart';
import 'package:adminside/presentation/prodectside/productadding.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';

class ProductAddingController extends GetxController {
  Rx<TextEditingController> textEditingControllername =
      TextEditingController().obs;
  Rx<TextEditingController> textEditingControllerprice =
      TextEditingController().obs;
  Rx<TextEditingController> textEditingControllerdescribe =
      TextEditingController().obs;
  Rx<TextEditingController> textEditingControllerminno =
      TextEditingController().obs;
  Rx<TextEditingController> textEditingController4 =
      TextEditingController().obs;
  UploadTask? task;
  //   image.obs;
  //
  editPage(ModelProduct? editproduct) {
    textEditingControllername.value.text = editproduct!.name;
    textEditingControllerprice.value.text = editproduct.price;
    textEditingControllerdescribe.value.text = editproduct.description;
    textEditingControllerminno.value.text = editproduct.minno;

    dropdownvaleu.value = editproduct.size;
    dropcategory.value = editproduct.category;
  }

  productAndEdit({required id}) async {
    if (textEditingControllername.value.text.isNotEmpty &&
        dropcategory.isNotEmpty &&
        dropdownvaleu.isNotEmpty &&
        textEditingControllerprice.value.text.isNotEmpty &&
        textEditingControllerdescribe.value.text.isNotEmpty &&
        textEditingControllerminno.value.text.isNotEmpty) {
      final productdetailnew = ModelProduct(
        imagelist: imagelist,
        description: textEditingControllerdescribe.value.text,
        name: textEditingControllername.value.text,
        category: dropcategory.value,
        minno: textEditingControllerminno.value.text,
        price: textEditingControllerprice.value.text,
        size: dropdownvaleu.value,
      );

      if (id == null) {
        addNewiintofireBase(productdetailnew);
        Get.back();
      } else {
        print(productdetailnew.toJson());
        addingEditedThings(id, productdetailnew);
        Get.back();
      }
      clearController();
    } else {
      Get.snackbar(
        'AddingDetail',
        'message',
        titleText: Text('Adding detail'),
        messageText: Text('Please fill it'),
      );
    }
  }

  clearController() {
    if (imagelist != null) {
      imagelist!.clear();
    }
    if (imagePath != '') {
      imagePath!.value = '';
    }
    textEditingControllername.value.clear();
    textEditingControllerprice.value.clear();
    textEditingControllerdescribe.value.clear();
    textEditingControllerminno.value.clear();
  }

  validate() {
    print(textEditingControllername.value.text);
  }

  RxString? imagePath = ''.obs;

  List<dynamic>? imagelist = [];
  // late Rx<XFile?> image;
  // var image = Rxn<XFile>();
  var dropdownvaleu = 'Small'.obs;
  var dropcategory = 'Feeds'.obs;
  onchange(valeu) {
    dropdownvaleu.value = valeu;
    //  update();
  }

  onchangeCategory(valeu) {
    dropcategory.value = valeu;
    // update();
  }

  AddingtoImageList(imagePath) {
    imagelist!.add(imagePath);
  }

  getImage({required ImageSource source}) async {
    final image = await ImagePicker().pickImage(source: source);
    File file = File(image!.path);
    if (file != null) {
      imagePath!.value = (image.path);
      final filename = basename(file.path);
      final destination = 'files/$filename';
      task = FireBaseApi.uplaodFile(destination, file);
      if (task == null) return;
      final snapshot = await task!.whenComplete(() {});
      final urlDownload = await snapshot.ref.getDownloadURL();
      AddingtoImageList(urlDownload);
    } else {
      return null;
    }
  }

  @override
  void onClose() {
    //THIS IS NEVER HIT
    super.onClose();
  }
}

class FireBaseApi {
  static UploadTask? uplaodFile(String destination, File file) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);

      return ref.putFile(file);
    } on FirebaseException catch (e) {
      return null;
    }
  }
}
