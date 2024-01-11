import 'package:hive_flutter/hive_flutter.dart';
part 'stock_details.g.dart';

@HiveType(typeId: 1)
class StockDetails extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  double purchaseRate;
  @HiveField(2)
  int qgst;
  @HiveField(3)
  int sgst;
  @HiveField(4)
  int quantity;
  @HiveField(5)
  double profit;
  @HiveField(6)
  double salesRate;
  @HiveField(7)
  double profitMargin;
  StockDetails({
    required this.name,
    required this.quantity,
    required this.profit,
    required this.profitMargin,
    required this.purchaseRate,
    required this.qgst,
    required this.salesRate,
    required this.sgst,
  });
}
