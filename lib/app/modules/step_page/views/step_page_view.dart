import 'package:adella_kitchen/app/modules/step_page/views/daftar_akun.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';
import '../controllers/step_page_controller.dart';

class StepPageView extends GetView<StepPageController> {
  const StepPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Stepper(
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
    );
  }

  List<Step> getStep() => [
        Step(
            title: Text(''),
            content: DaftarAkun(),
            isActive: controller.currentStep.value >= 0,
            state: controller.currentStep.value > 0
                ? StepState.complete
                : StepState.indexed),
        Step(
            title: Text(''),
            content: Container(),
            isActive: controller.currentStep.value >= 1,
            state: controller.currentStep.value > 1
                ? StepState.complete
                : StepState.indexed),
        Step(
            title: Text(''),
            content: Container(),
            isActive: controller.currentStep.value >= 2,
            state: controller.currentStep.value > 2
                ? StepState.complete
                : StepState.indexed),
        Step(
            title: Text(''),
            content: Container(),
            isActive: controller.currentStep.value >= 2,
            state: controller.currentStep.value > 2
                ? StepState.complete
                : StepState.indexed)
      ];
}
