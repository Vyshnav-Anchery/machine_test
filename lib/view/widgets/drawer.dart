import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/drawer_controller.dart';
import '../../core/constants.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomDrawerController>(
        builder: (context, controller, child) {
      return Drawer(
          child: ListView(
        children: [
          Row(
            children: [
              Builder(builder: (context) {
                return IconButton(
                    onPressed: () {
                      Scaffold.of(context).closeDrawer();
                    },
                    icon: const Icon(Icons.menu_open));
              }),
            ],
          ),
          ListTile(
            selectedTileColor: Theme.of(context).primaryColor,
            selectedColor: Colors.white,
            selected: controller.selectedItem == CustomDrawerItem.dashboard,
            onTap: () => controller.navigateToDashboard(context),
            title: const Text("Dashboard"),
          ),
          ListTile(
            onTap: () {},
            title: const Text("Purchase"),
          ),
          ExpansionTile(
            initiallyExpanded:
                controller.selectedItem == CustomDrawerItem.allStock ||
                    controller.selectedItem == CustomDrawerItem.addStock,
            title: const Text("Stock"),
            children: [
              ListTile(
                  selectedTileColor: Theme.of(context).primaryColor,
                  selectedColor: Colors.white,
                  selected:
                      controller.selectedItem == CustomDrawerItem.allStock,
                  onTap: () => controller.navigateToAllStock(context),
                  title: const Text("All Stock")),
              ListTile(
                  selectedTileColor: Theme.of(context).primaryColor,
                  selectedColor: Colors.white,
                  selected:
                      controller.selectedItem == CustomDrawerItem.addStock,
                  onTap: () => controller.navigateToAddStock(context),
                  title: const Text("Add Stock")),
              ListTile(onTap: () {}, title: const Text("Transfer")),
            ],
          ),
        ],
      ));
    });
  }
}
