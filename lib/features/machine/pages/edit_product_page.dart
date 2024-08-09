import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/product.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/textfields/txt_field.dart';
import '../bloc/machine_bloc.dart';
import '../widgets/consumption_times.dart';

class EditProductPage extends StatefulWidget {
  const EditProductPage({super.key, required this.product});

  final Product product;

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();
  final controller5 = TextEditingController();

  String consumption = '';
  bool edit = false;
  bool consumptionExpanded = false;

  void onEdit() async {
    context.read<MachineBloc>().add(
          EditProductEvent(
            product: Product(
              id: widget.product.id,
              name: controller3.text,
              price: int.tryParse(controller4.text) ?? 0,
              consumptionPrice: int.tryParse(controller5.text) ?? 0,
              consumption: consumption,
            ),
          ),
        );
    context.pop();
  }

  void onChanged() {
    setState(() {
      if (controller3.text != widget.product.name) {
        edit = true;
      } else if (controller4.text != widget.product.price.toString()) {
        edit = true;
      } else if (controller5.text !=
          widget.product.consumptionPrice.toString()) {
        edit = true;
      } else {
        edit = false;
      }
    });
  }

  void onConsumptionSelect(String value) {
    setState(() {
      consumption = value;
      consumptionExpanded = false;
      if (consumption != widget.product.consumption) {
        edit = true;
      } else {
        onChanged();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    controller3.text = widget.product.name;
    controller4.text = widget.product.price.toString();
    controller5.text = widget.product.consumptionPrice.toString();
    consumption = widget.product.consumption;
  }

  @override
  void dispose() {
    controller3.dispose();
    controller4.dispose();
    controller5.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          CustomAppbar(
            edit ? 'Edit product' : 'Product',
            onEdit: edit ? onEdit : null,
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                const SizedBox(height: 40),
                TxtField(
                  controller: controller3,
                  hintText: 'Product name',
                  onChanged: onChanged,
                ),
                const SizedBox(height: 24),
                TxtField(
                  controller: controller4,
                  hintText: 'Price per thing',
                  number: true,
                  onChanged: onChanged,
                ),
                const SizedBox(height: 24),
                TxtField(
                  controller: controller5,
                  hintText: 'Consumption of goods for the period',
                  number: true,
                  onChanged: onChanged,
                ),
                // const SizedBox(height: 24),
                // const Center(
                //   child: Text(
                //     'Type of products',
                //     style: TextStyle(
                //       color: AppColors.black,
                //       fontSize: 24,
                //       fontWeight: FontWeight.w700,
                //       fontFamily: 'SFB',
                //     ),
                //   ),
                // ),
                // const SizedBox(height: 24),
                // if (typeExpanded) ...[
                //   MachineTypes(
                //     type: getProductType(widget.product),
                //     onTap: onConsumptionSelect,
                //   ),
                // ] else
                //   Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       CupertinoButton(
                //         onPressed: () {
                //           setState(() {
                //             typeExpanded = true;
                //           });
                //         },
                //         padding: EdgeInsets.zero,
                //         child: Container(
                //           height: 62,
                //           width: 175,
                //           decoration: BoxDecoration(
                //             color: AppColors.main,
                //             borderRadius: BorderRadius.circular(12),
                //             border: Border.all(
                //               color: AppColors.main,
                //               width: 1,
                //             ),
                //           ),
                //           child: Center(
                //             child: Text(
                //               getProductType(widget.product),
                //               style: const TextStyle(
                //                 color: Colors.white,
                //                 fontSize: 16,
                //                 fontWeight: FontWeight.w500,
                //                 fontFamily: 'SFM',
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                const SizedBox(height: 24),
                const Center(
                  child: Text(
                    'Consumption time',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'SFB',
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                if (consumptionExpanded)
                  ConsumptionTimes(
                    cunsumption: consumption,
                    onTap: onConsumptionSelect,
                  )
                else
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CupertinoButton(
                        onPressed: () {
                          setState(() {
                            consumptionExpanded = true;
                          });
                        },
                        padding: EdgeInsets.zero,
                        child: Container(
                          height: 62,
                          width: 175,
                          decoration: BoxDecoration(
                            color: AppColors.main,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: AppColors.main,
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              consumption,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'SFM',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
