import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../src.dart';
part 'employment_provider.g.dart';

@riverpod
class EmploymentNotifier extends _$EmploymentNotifier {
  @override
  Employment build() {
    return Employment(
      employmentType: 'Full-time',
      employer: 'Acme Corp',
      jobTitle: 'Software Engineer',
      grossAnnualIncome: 120000,
      payFrequency: 'Bi-weekly',
      employerAddress: '1234 Elm Street, Springfield, IL',
      yearsWithEmployer: 2,
      monthsWithEmployer: 6,
      nextPayDay: DateTime.now().add(Duration(days: 14)),
      directDeposits: true,
    );
  }
}
