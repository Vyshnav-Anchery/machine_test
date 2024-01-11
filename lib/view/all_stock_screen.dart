import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/table_controller.dart';
import 'package:flutter_application_1/core/hive_box.dart';
import 'package:flutter_application_1/view/widgets/appbar.dart';
import 'package:flutter_application_1/view/widgets/drawer.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import '../model/stock_details.dart';

class AllStock extends StatelessWidget {
  const AllStock({super.key});

  @override
  Widget build(BuildContext context) {
    StockController stockController = Provider.of(context, listen: false);
    List<StockDetails> detailsList = [...stockDetailsBox.values];
    return Scaffold(
      appBar: customAppbar(
        context: context,
        title: "All Stock",
        iconButton: IconButton(
            onPressed: () {
              stockController.sort(detailsList);
            },
            icon: const Icon(Icons.sort_rounded)),
      ),
      drawer: const CustomDrawer(),
      body:
          Consumer<StockController>(builder: (context, tableController, child) {
        return ListenableBuilder(
          listenable: stockDetailsBox.listenable(),
          builder: (context, child) {
            if (stockDetailsBox.isEmpty) {
              return DataTable(
                  columns: tableController.tableheadings, rows: const []);
            } else {
              return ConstrainedBox(
                constraints:
                    BoxConstraints(minWidth: MediaQuery.sizeOf(context).width),
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(
                            minWidth: MediaQuery.sizeOf(context).width),
                        child: DataTable(
                          headingRowColor: MaterialStatePropertyAll(
                              Colors.deepPurple.shade100),
                          showBottomBorder: true,
                          border: TableBorder.all(),
                          columns: tableController.tableheadings,
                          rows: List.generate(stockDetailsBox.length, (index) {
                            StockDetails stockDetails = detailsList[index];
                            return DataRow(cells: [
                              DataCell(Text(index.toString())),
                              DataCell(Text(stockDetails.name)),
                              DataCell(Text(stockDetails.quantity.toString())),
                              DataCell(
                                  Text(stockDetails.purchaseRate.toString())),
                              DataCell(Text(stockDetails.qgst.toString())),
                              DataCell(Text(stockDetails.sgst.toString())),
                              DataCell(Text(stockDetails.salesRate.toString())),
                              DataCell(Text(stockDetails.profit.toString())),
                              DataCell(
                                  Text(stockDetails.profitMargin.toString())),
                            ]);
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        );
      }),
    );
  }
}

// class AllStock extends StatelessWidget {
//   const AllStock({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: customAppbar(context: context, title: "All Stock"),
//       drawer: const CustomDrawer(),
//       body: Consumer<PaginationController>(
//         builder: (context, paginationController, child) {
//           StockController stockController = Provider.of(context);
//           return ListenableBuilder(
//             listenable: stockDetailsBox.listenable(),
//             builder: (context, child) {
//               List<StockDetails> detailsList = [...stockDetailsBox.values];

//               int startIndex = paginationController.startIndex;
//               int endIndex = paginationController.endIndex;

//               endIndex =
//                   endIndex > detailsList.length ? detailsList.length : endIndex;

//               List<StockDetails> paginatedList =
//                   detailsList.sublist(startIndex, endIndex);

//               return SizedBox(
//                 width: MediaQuery.of(context).size.width,
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children: [
//                     DataTable(
//                       headingRowColor:
//                           MaterialStatePropertyAll(Colors.deepPurple.shade100),
//                       showBottomBorder: true,
//                       border: TableBorder.all(),
//                       columns: stockController.tableheadings,
//                       rows: List.generate(paginatedList.length, (index) {
//                         StockDetails stockDetails = paginatedList[index];
//                         return DataRow(cells: [
//                           DataCell(Text(index.toString())),
//                           DataCell(Text(stockDetails.name)),
//                           DataCell(Text(stockDetails.purchaseRate.toString())),
//                           DataCell(Text(stockDetails.qgst.toString())),
//                           DataCell(Text(stockDetails.sgst.toString())),
//                           DataCell(Text(stockDetails.salesRate.toString())),
//                           DataCell(Text(stockDetails.profit.toString())),
//                           DataCell(Text(stockDetails.profitMargin.toString())),
//                         ]);
//                       }),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Provider.of<PaginationController>(context, listen: false).loadMore();
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

// class PaginationController extends ChangeNotifier {
//   int pageSize = 2;
//   int currentPage = 1;

//   void loadMore() {
//     currentPage++;
//     notifyListeners();
//   }

//   int get startIndex => (currentPage - 1) * pageSize;
//   int get endIndex => startIndex + pageSize;
// }
