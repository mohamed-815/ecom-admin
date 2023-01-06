import 'package:get/state_manager.dart';

class ItemShowingController extends GetxController {
  final images = [
    'assets/Moor_color_change.jpg',
    'assets/images (5).jpeg',
  ];
  var currentindex = 0;
  itemChanging(index) {
    currentindex = index;
    update();
  }
}
