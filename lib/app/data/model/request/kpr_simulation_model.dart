class LoanSimulationInput {
  final double propertyPrice;
  final double downPayment;
  final double interestRate;
  final int loanTerm;

  LoanSimulationInput({
    required this.propertyPrice,
    required this.downPayment,
    required this.interestRate,
    required this.loanTerm,
  });
}

class LoanSimulationResult {
  double? monthlyInstallment;
  double? summaryPrincipalLoan;
  double? summaryInterestPrice;
  double? summaryTotalLoan;
  List<LoanForYear>? installmentByYear;

  LoanSimulationResult({
    this.monthlyInstallment,
    this.summaryPrincipalLoan,
    this.summaryInterestPrice,
    this.summaryTotalLoan,
    this.installmentByYear,
  });
}

class LoanForYear {
  int? year;
  double? installment;

  LoanForYear({
    this.year,
    this.installment,
  });
}

class MortgageSimulationRequest {
  final double propertyPrice;
  final double downPayment;
  final double interestRate;
  final int loanTerm;

  MortgageSimulationRequest({
    required this.propertyPrice,
    required this.downPayment,
    required this.interestRate,
    required this.loanTerm,
  });
}

class MortgageSimulationResult {
  final List<double> monthlyInstallments;

  MortgageSimulationResult({required this.monthlyInstallments});
}
