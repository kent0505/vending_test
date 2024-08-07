import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/textfields/txt_field.dart';
import '../widgets/machine_page_indicator.dart';
import '../widgets/machine_types.dart';

class AddMachinePage extends StatefulWidget {
  const AddMachinePage({super.key});

  @override
  State<AddMachinePage> createState() => _AddMachinePageState();
}

class _AddMachinePageState extends State<AddMachinePage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();

  bool active = false;
  int pageIndex = 0;
  String pageTitle = 'New machine';
  String machineType = '';

  void checkActive() {
    setState(() {
      if (controller1.text.isEmpty) {
        active = false;
      } else if (controller2.text.isEmpty) {
        active = false;
      } else {
        active = true;
      }
    });
  }

  void onTypeSelect(String value) {
    setState(() {
      machineType = value;
      active = true;
    });
  }

  void changeValues(bool next) {
    if (next) {
      pageIndex++;
      active = false;
    } else {
      pageIndex--;
    }
    setState(() {
      if (pageIndex == 1) {
        pageTitle = 'Type machine';
      } else if (pageIndex == 2) {
        pageTitle = 'Product details';
      } else {
        pageTitle = 'New machine';
      }
    });
  }

  void onNext() {
    if (pageIndex < 2) changeValues(true);
  }

  void onBack() {
    if (pageIndex == 0) {
      context.pop();
    } else {
      changeValues(false);
    }
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          CustomAppbar(
            pageTitle,
            onBack: onBack,
          ),
          const SizedBox(height: 40),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  if (pageIndex == 0) ...[
                    TxtField(
                      controller: controller1,
                      hintText: 'Name',
                      onChanged: checkActive,
                    ),
                    const SizedBox(height: 24),
                    TxtField(
                      controller: controller2,
                      hintText: 'Location',
                      onChanged: checkActive,
                    ),
                  ],
                  if (pageIndex == 1)
                    MachineTypes(
                      type: machineType,
                      onTap: onTypeSelect,
                    ),
                  const Spacer(),
                  MachinePageIndicator(index: pageIndex),
                  const SizedBox(height: 20),
                  PrimaryButton(
                    title: 'Next',
                    active: active,
                    onPressed: onNext,
                  ),
                  const SizedBox(height: 47),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
