import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/drawer_controller.dart';
import 'package:flutter_application_1/controller/table_controller.dart';
import 'package:flutter_application_1/core/constants.dart';
import 'package:flutter_application_1/core/hive_box.dart';
import 'package:flutter_application_1/model/stock_details.dart';
import 'package:flutter_application_1/view/home.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

// import 'view/all_stock_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(StockDetailsAdapter());
  await Hive.openBox<StockDetails>(AppConstants.stockBoxName);
  stockDetailsBox = Hive.box<StockDetails>(AppConstants.stockBoxName);

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<StockController>(
      create: (context) => StockController(),
    ),
    ChangeNotifierProvider<CustomDrawerController>(
      create: (context) => CustomDrawerController(),
    ),
    // ChangeNotifierProvider<PaginationController>(
    //   create: (context) => PaginationController(),
    // ),
  ], child: const MyApp()));
}

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: scaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SafeArea(child: HomePage()),
    );
  }
}
