import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';

class ProductAddingController extends GetxController {
  //   image.obs;
  //
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
    if (image != null) {
      imagePath!.value = (image.path);
      AddingtoImageList(imagePath!.value);
    } else {
      return null;
    }
  }
}
