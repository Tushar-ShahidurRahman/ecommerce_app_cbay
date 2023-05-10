import 'package:get/get.dart';

class BottomNavigationBarController extends GetxController {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void changePageWhenTapped(int index) {
    _selectedIndex = index;
    update();
  }

  void goToHomePage() {
    if (selectedIndex != 0) {
      _selectedIndex = 0;
      update();
    }
  }
}
