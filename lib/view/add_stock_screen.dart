import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/table_controller.dart';
import 'package:flutter_application_1/view/widgets/appbar.dart';
import 'package:flutter_application_1/view/widgets/drawer.dart';
import 'package:flutter_application_1/view/widgets/user_input.dart';
import 'package:provider/provider.dart';

class AddStock extends StatelessWidget {
  const AddStock({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController nameEditingController = TextEditingController();
    TextEditingController purchaseEditingController = TextEditingController();
    TextEditingController quantityEditingController = TextEditingController();
    TextEditingController qgstEditingController = TextEditingController();
    TextEditingController sgstEditingController = TextEditingController();
    TextEditingController salesEditingController = TextEditingController();
    TextEditingController profitEditingController = TextEditingController();
    TextEditingController profitMarginEditingController =
        TextEditingController();
    sgstEditingController.text = "8%";
    qgstEditingController.text = "8%";
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: customAppbar(context: context, title: 'Add Stock Details'),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Consumer<StockController>(
              builder: (context, stockController, child) {
            return Form(
              key: formKey,
              child: Column(
                children: [
                  CustomFormField(
                      hintText: "Name",
                      isName: true,
                      texteditingController: nameEditingController),
                  const SizedBox(height: 30),
                  CustomFormField(
                      hintText: "Quantity",
                      texteditingController: quantityEditingController),
                  const SizedBox(height: 30),
                  CustomFormField(
                      hintText: "Purchase amt",
                      texteditingController: purchaseEditingController),
                  const SizedBox(height: 30),
                  CustomFormField(
                      hintText: "Sale amt",
                      texteditingController: salesEditingController,
                      onSubmitted: (p0) {
                        stockController.getProfit(
                            salesRateController: salesEditingController,
                            purchaseRateController: purchaseEditingController,
                            profitController: profitEditingController,
                            profitMarginController:
                                profitMarginEditingController,
                            quantityController: quantityEditingController);
                      }),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width / 3,
                        child: CustomFormField(
                            hintText: "QGST",
                            disabled: false,
                            texteditingController: qgstEditingController),
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width / 3,
                        child: CustomFormField(
                            hintText: "SGST",
                            disabled: false,
                            texteditingController: sgstEditingController),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  CustomFormField(
                      disabled: false,
                      hintText: "Profit",
                      texteditingController: profitEditingController),
                  const SizedBox(height: 30),
                  CustomFormField(
                      hintText: "Profit Margine",
                      disabled: false,
                      texteditingController: profitMarginEditingController),
                  const SizedBox(height: 30),
                  SizedBox(
                      width: 200,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10)))),
                          onPressed: () {
                            stockController.addToHive(
                                salesRateController: salesEditingController,
                                nameController: nameEditingController,
                                purchaseRateController:
                                    purchaseEditingController,
                                profitController: profitEditingController,
                                quantityController: quantityEditingController,
                                profitMarginController:
                                    profitMarginEditingController);
                          },
                          child: const Text("Submit")))
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
