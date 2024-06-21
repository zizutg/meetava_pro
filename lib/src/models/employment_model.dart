import '../src.dart';

class Employment {
  final String employmentType;
  final String employer;
  final String jobTitle;
  final double grossAnnualIncome;
  final String payFrequency;
  final String employerAddress;
  final int timeWithEmployer; // in months
  final DateTime nextPayDay;
  final DirectDeposit directDeposit;

  Employment({
    required this.employmentType,
    required this.employer,
    required this.jobTitle,
    required this.grossAnnualIncome,
    required this.payFrequency,
    required this.employerAddress,
    required this.timeWithEmployer,
    required this.nextPayDay,
    required this.directDeposit,
  });

  Employment copyWith({
    String? employmentType,
    String? employer,
    String? jobTitle,
    double? grossAnnualIncome,
    String? payFrequency,
    String? employerAddress,
    int? timeWithEmployer,
    DateTime? nextPayDay,
    DirectDeposit? directDeposit,
  }) {
    return Employment(
      employmentType: employmentType ?? this.employmentType,
      employer: employer ?? this.employer,
      jobTitle: jobTitle ?? this.jobTitle,
      grossAnnualIncome: grossAnnualIncome ?? this.grossAnnualIncome,
      payFrequency: payFrequency ?? this.payFrequency,
      employerAddress: employerAddress ?? this.employerAddress,
      timeWithEmployer: timeWithEmployer ?? this.timeWithEmployer,
      nextPayDay: nextPayDay ?? this.nextPayDay,
      directDeposit: directDeposit ?? this.directDeposit,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Employment type': employmentType,
      'Employer': employer,
      'Job title': jobTitle,
      'Gross annual income': grossAnnualIncome,
      'Pay frequency': payFrequency,
      'Employer address': employerAddress,
      'Time with employer': timeWithEmployer,
      'Next payday': nextPayDay.toIso8601String(),
      'Is your pay direct deposit?': directDeposit,
    };
  }

  factory Employment.fromMap(Map<String, dynamic> map) {
    return Employment(
      employmentType: map['Employment type'] ?? '',
      employer: map['Employer'] ?? '',
      jobTitle: map['Job title'] ?? '',
      grossAnnualIncome: map['Gross annual income']?.toDouble() ?? 0.0,
      payFrequency: map['Pay frequency'] ?? '',
      employerAddress: map['Employer address'] ?? '',
      timeWithEmployer: map['Time with employer'] ?? 0,
      nextPayDay: DateTime.parse(map['Next payday']),
      directDeposit: map['Is your pay direct deposit?'] ?? DirectDeposit.Yes,
    );
  }
}
