import 'package:flutter/material.dart';

customAppbar(
    {required BuildContext context,
    required String title,
    IconButton? iconButton}) {
  return AppBar(
    iconTheme: const IconThemeData(color: Colors.white),
    backgroundColor: Theme.of(context).primaryColor,
    actions: [iconButton ?? Container()],
    leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(Icons.menu),
        );
      },
    ),
    title: Text(
      title,
      style: const TextStyle(color: Colors.white),
    ),
  );
}
