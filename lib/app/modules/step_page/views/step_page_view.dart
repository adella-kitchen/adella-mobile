import 'package:adella_kitchen/app/modules/step_page/views/daftar_akun.dart';
import 'package:adella_kitchen/app/modules/step_page/views/daftar_alamat.dart';
import 'package:adella_kitchen/app/modules/step_page/views/tambah_notelf.dart';
import 'package:adella_kitchen/app/modules/step_page/views/verif_notelf.dart';
import 'package:adella_kitchen/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/step_page_controller.dart';

class StepPageView extends GetView<StepPageController> {
  const StepPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(primary: myColor().primaryColor),
           textTheme: Theme.of(context).textTheme.copyWith(
              bodyLarge: TextStyle(color: Colors.black),
            ),
          ),
          child: Stepper(
            controlsBuilder: (BuildContext context, ControlsDetails controls) {
              return Container();
            },
            type: StepperType.horizontal,
            steps: getStep(),
            currentStep: controller.currentStep.value,
            onStepContinue: () {
              controller.nextStep();
            },
            onStepCancel: () {
              controller.previousStep();
            },
            onStepTapped: (step) {
              controller.goToStep(step);
            },
          ),
        ),
      ),
    );
  }

  List<Step> getStep() => [
        Step(
          title: Text(''),
          content: DaftarAkun(),
          isActive: controller.currentStep.value >= 0,
          state: controller.currentStep.value > 0
              ? StepState.complete
              : StepState.indexed,
        ),
        Step(
          title: Text(''),
          content: NomerTelfon(),
          isActive: controller.currentStep.value >= 1,
          state: controller.currentStep.value > 1
              ? StepState.complete
              : StepState.indexed,
        ),
        Step(
          title: Text(''),
          content: VerifNotelf(),
          isActive: controller.currentStep.value >= 2,
          state: controller.currentStep.value > 2
              ? StepState.complete
              : StepState.indexed,
        ),
        Step(
          title: Text(''),
          content: DaftarAlamat(),
          isActive: controller.currentStep.value >= 3,
          state: controller.currentStep.value > 3
              ? StepState.complete
              : StepState.indexed,
        ),
      ];
}
