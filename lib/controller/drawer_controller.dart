import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/home.dart';

import '../core/constants.dart';
import '../view/add_stock_screen.dart';
import '../view/all_stock_screen.dart';

class CustomDrawerController extends ChangeNotifier {
  CustomDrawerItem _selectedItem = CustomDrawerItem.dashboard;
  CustomDrawerItem get selectedItem => _selectedItem;

  void selectItem(CustomDrawerItem item) {
    _selectedItem = item;
    notifyListeners();
  }

  navigateToDashboard(BuildContext context) {
    selectItem(CustomDrawerItem.dashboard);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ));
  }

  navigateToAllStock(BuildContext context) {
    selectItem(CustomDrawerItem.allStock);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AllStock(),
        ));
  }

  navigateToAddStock(BuildContext context) {
    selectItem(CustomDrawerItem.addStock);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AddStock(),
        ));
  }
}
