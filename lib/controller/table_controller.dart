import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/hive_box.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/model/stock_details.dart';

class StockController extends ChangeNotifier {
  final List<DataColumn> tableheadings = const [
    DataColumn(label: Text('ID')),
    DataColumn(label: Text('Name')),
    DataColumn(label: Text('Quantity')),
    DataColumn(label: Text('Purchase Rate')),
    DataColumn(label: Text('QGST')),
    DataColumn(label: Text('SGST')),
    DataColumn(label: Text('Sales Rate')),
    DataColumn(label: Text('Profit(Rs.)')),
    DataColumn(label: Text('Profit Margin(%)')),
  ];
  sort(List<StockDetails> detailsList) {
    detailsList.sort((a, b) => b.profitMargin.compareTo(a.profitMargin));
    notifyListeners();
  }

  getProfit({
    required TextEditingController salesRateController,
    required TextEditingController purchaseRateController,
    required TextEditingController profitController,
    required TextEditingController quantityController,
    required TextEditingController profitMarginController,
  }) {
    double saleAmount = double.parse(salesRateController.text);
    double purchaseAmount = double.parse(purchaseRateController.text);
    int quantity = int.parse(quantityController.text);
    double profitBeforeGst = (saleAmount - purchaseAmount) * quantity;
    double gstAmount = (16 / 100) * saleAmount * quantity;
    double profit = profitBeforeGst - gstAmount;
    double profitMargine = (profit / saleAmount) * 100;
    profitController.text = profit.toStringAsFixed(2);
    profitMarginController.text = profitMargine.toStringAsFixed(2);
    log(profitMargine.toString());
    notifyListeners();
  }

  addToHive({
    required TextEditingController salesRateController,
    required TextEditingController nameController,
    required TextEditingController purchaseRateController,
    required TextEditingController profitController,
    required TextEditingController quantityController,
    required TextEditingController profitMarginController,
  }) {
    String name = nameController.text;
    int quantity = int.parse(quantityController.text);
    double profit = double.parse(profitController.text);
    double profitMargin = double.parse(profitMarginController.text);
    double purchaseRate = double.parse(purchaseRateController.text);
    double salesRate = double.parse(salesRateController.text);
    stockDetailsBox.add(StockDetails(
        name: name,
        quantity: quantity,
        profit: profit,
        profitMargin: profitMargin,
        purchaseRate: purchaseRate,
        qgst: 8,
        salesRate: salesRate,
        sgst: 8));
    quantityController.clear();
    profitController.clear();
    profitMarginController.clear();
    nameController.clear();
    salesRateController.clear();
    purchaseRateController.clear();
    scaffoldMessengerKey.currentState!
        .showSnackBar(const SnackBar(content: Text("Stock Added")));
    notifyListeners();
  }
}
