import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:propertio_getx/app/data/model/request/kpr_simulation_model.dart';
import 'dart:math' as math;

class KprController extends GetxController {
  TextEditingController propertyPriceController = TextEditingController();
  TextEditingController downPaymentController = TextEditingController();
  TextEditingController interestRateController = TextEditingController();
  TextEditingController loanTermController = TextEditingController();
  RxDouble downPaymentPercen = 0.0.obs;

  var isCalculated = false.obs;
  Rx<LoanSimulationResult> loanSimulationResult = LoanSimulationResult().obs;

  RxInt sliderVal = 1.obs;

  void setSliderVal(int val) {
    sliderVal.value = val;
    interestRateController.text = val.toString();
    update();
  }

  void setDownPaymentPercen(String val) {
    downPaymentPercen.value = val.isEmpty
        ? 0
        : (double.parse(val.replaceAll(',', '')) /
                double.parse(
                    propertyPriceController.text.replaceAll('.', ''))) *
            100;
  }

  void validateForm() {
    if (propertyPriceController.text.isEmpty) {
      Get.snackbar('Error', 'Harga Properti tidak boleh kosong',
          duration: Duration(seconds: 1));
      return;
    }
    if (downPaymentController.text.isEmpty) {
      Get.snackbar('Error', 'Uang Muka tidak boleh kosong',
          duration: Duration(seconds: 1));
      return;
    }
    if (interestRateController.text.isEmpty) {
      Get.snackbar('Error', 'Suku Bunga tidak boleh kosong',
          duration: Duration(seconds: 1));
      return;
    }
    if (loanTermController.text.isEmpty) {
      Get.snackbar('Error', 'Jangka Waktu tidak boleh kosong',
          duration: Duration(seconds: 1));
      return;
    }
    calculateKpr();
  }

  void calculateKpr() {
    isCalculated(false);
    var input = LoanSimulationInput(
        propertyPrice:
            double.parse(propertyPriceController.text.replaceAll('.', '')),
        downPayment:
            double.parse(downPaymentController.text.replaceAll('.', '')),
        interestRate: double.parse(interestRateController.text),
        loanTerm: int.parse(loanTermController.text));

    double loanAmount = input.propertyPrice - input.downPayment;
    double monthlyInterestRate = input.interestRate / 100 / 12;
    var listYear = [5, 10, 15, 20, 25, 30];

    if (!listYear.contains(input.loanTerm)) {
      listYear.insert(0, input.loanTerm);
    }

    print(listYear);
    var listLoan = listYear
        .map((jangkaWaktu) => LoanForYear(
            year: jangkaWaktu,
            installment: (loanAmount * monthlyInterestRate) /
                (1 - math.pow(1 + monthlyInterestRate, -(jangkaWaktu * 12)))))
        .toList();
    loanSimulationResult.value = LoanSimulationResult(
        summaryPrincipalLoan: loanAmount,
        summaryInterestPrice: ((loanAmount) * (input.interestRate / 100)),
        summaryTotalLoan:
            (loanAmount) + ((loanAmount) * (input.interestRate / 100)),
        installmentByYear: listLoan);
    isCalculated(true);
  }

  void resetFormKpr() {
    propertyPriceController.clear();
    downPaymentController.clear();
    interestRateController.clear();
    loanTermController.clear();
    downPaymentPercen.value = 0.0;
    sliderVal.value = 1;
    loanSimulationResult.value = LoanSimulationResult();
    isCalculated(false);
  }
}
