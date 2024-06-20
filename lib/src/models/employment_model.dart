class Employment {
  final String employmentType;
  final String employer;
  final String jobTitle;
  final double grossAnnualIncome;
  final String payFrequency;
  final String employerAddress;
  final int yearsWithEmployer;
  final int monthsWithEmployer;
  final DateTime nextPayDay;
  final bool directDeposits;

  Employment({
    required this.employmentType,
    required this.employer,
    required this.jobTitle,
    required this.grossAnnualIncome,
    required this.payFrequency,
    required this.employerAddress,
    required this.yearsWithEmployer,
    required this.monthsWithEmployer,
    required this.nextPayDay,
    required this.directDeposits,
  });

  Employment copyWith({
    String? employmentType,
    String? employer,
    String? jobTitle,
    double? grossAnnualIncome,
    String? payFrequency,
    String? employerAddress,
    int? yearsWithEmployer,
    int? monthsWithEmployer,
    DateTime? nextPayDay,
    bool? directDeposits,
  }) {
    return Employment(
      employmentType: employmentType ?? this.employmentType,
      employer: employer ?? this.employer,
      jobTitle: jobTitle ?? this.jobTitle,
      grossAnnualIncome: grossAnnualIncome ?? this.grossAnnualIncome,
      payFrequency: payFrequency ?? this.payFrequency,
      employerAddress: employerAddress ?? this.employerAddress,
      yearsWithEmployer: yearsWithEmployer ?? this.yearsWithEmployer,
      monthsWithEmployer: monthsWithEmployer ?? this.monthsWithEmployer,
      nextPayDay: nextPayDay ?? this.nextPayDay,
      directDeposits: directDeposits ?? this.directDeposits,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Employment Type': employmentType,
      'Employer': employer,
      'Job Title': jobTitle,
      'Gross Annual Income': grossAnnualIncome,
      'Pay Frequency': payFrequency,
      'Employer Address': employerAddress,
      'Years with Employer': yearsWithEmployer,
      'Months with Employer': monthsWithEmployer,
      'Next Pay Day': nextPayDay.toIso8601String(),
      'Direct Deposits': directDeposits,
    };
  }

  factory Employment.fromMap(Map<String, dynamic> map) {
    return Employment(
      employmentType: map['Employment Type'] ?? '',
      employer: map['Employer'] ?? '',
      jobTitle: map['Job Title'] ?? '',
      grossAnnualIncome: map['Gross Annual Income']?.toDouble() ?? 0.0,
      payFrequency: map['Pay Frequency'] ?? '',
      employerAddress: map['Employer Address'] ?? '',
      yearsWithEmployer: map['Years with Employer'] ?? 0,
      monthsWithEmployer: map['Months with Employer'] ?? 0,
      nextPayDay: DateTime.parse(map['Next Pay Day']),
      directDeposits: map['Direct Deposits'] ?? false,
    );
  }
}
