import 'package:get/get.dart';

class StepPageController extends GetxController {  

  var currentStep = 0.obs;

  void nextStep() {
    if (currentStep < 2) { // Asumsikan ada 3 langkah, jadi maksimal 2 (0, 1, 2)
      currentStep++;
    }
  }

  void previousStep() {
    if (currentStep > 0) {
      currentStep--;
    }
  }

  void goToStep(int step) {
    currentStep.value = step;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
