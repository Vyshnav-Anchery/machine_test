// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/controller/table_controller.dart';
// import 'package:flutter_application_1/model/stock_details.dart';
// import 'package:flutter_application_1/view/widgets/user_input.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:provider/provider.dart';

// import '../core/hive_box.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     TableController tableController =
//         Provider.of<TableController>(context, listen: false);
//     return Scaffold(
//       body: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: ListenableBuilder(
//               listenable: stockDetailsBox.listenable(),
//               builder: (context, child) {
//                 return stockDetailsBox.isEmpty
//                     ? SizedBox(
//                         width: MediaQuery.sizeOf(context).width,
//                         child: DataTable(
//                           showBottomBorder: true,
//                           border: TableBorder.all(),
//                           columns: tableController.tableheadings,
//                           rows: [userInputField(context, tableController)],
//                         ),
//                       )
//                     : SizedBox(
//                         width: MediaQuery.sizeOf(context).width,
//                         child: DataTable(
//                           showBottomBorder: true,
//                           border: TableBorder.all(),
//                           columns: tableController.tableheadings,
//                           rows: [
//                             ...List.generate(stockDetailsBox.length, (index) {
//                               StockDetails stockDetails =
//                                   stockDetailsBox.getAt(index)!;
//                               return DataRow(cells: [
//                                 DataCell(Text(index.toString())),
//                                 DataCell(Text(stockDetails.name)),
//                                 DataCell(
//                                     Text(stockDetails.purchaseRate.toString())),
//                                 DataCell(Text(stockDetails.qgst.toString())),
//                                 DataCell(Text(stockDetails.sgst.toString())),
//                                 DataCell(
//                                     Text(stockDetails.salesRate.toString())),
//                                 DataCell(Text(stockDetails.profit.toString())),
//                                 DataCell(
//                                     Text(stockDetails.profitMargin.toString())),
//                                 const DataCell(Text('')),
//                               ]);
//                             }),
//                             userInputField(context, tableController)
//                           ],
//                         ),
//                       );
//               }),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/widgets/appbar.dart';
import 'package:flutter_application_1/view/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context: context, title: "Dashboard"),
      drawer: const CustomDrawer(),
      body: Container(),
    );
  }
}
