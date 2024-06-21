import 'package:intl/intl.dart';
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
      employerAddress: '1234 Elm Street, Springfield, ILw',
      timeWithEmployer: 30,
      nextPayDay: DateTime.now().add(const Duration(days: 14)),
      directDeposit: DirectDeposit.Yes,
    );
  }

  TitleType getTitleType(String title) {
    switch (title) {
      case 'Time with employer':
        return TitleType.timeWithEmployer;
      case 'Gross annual income':
        return TitleType.grossAnnualIncome;
      case 'Next payday':
        return TitleType.nextPayday;
      case 'Is your pay direct deposit?':
        return TitleType.directDeposit;
      default:
        return TitleType.other;
    }
  }

  String formatedString({required String title, required String subTitle}) {
    TitleType titleType = getTitleType(title);

    switch (titleType) {
      case TitleType.timeWithEmployer:
        return formatTimeWithEmployer(state.timeWithEmployer);
      case TitleType.grossAnnualIncome:
        return formatGrossAnnualIncome(state.grossAnnualIncome);
      case TitleType.nextPayday:
        return formatNextPayday(state.nextPayDay);
      case TitleType.directDeposit:
        return formatDirectDeposit(state.directDeposit);
      case TitleType.other:
      default:
        return subTitle;
    }
  }

  String formatTimeWithEmployer(int months) {
    int year = months ~/ 12;
    int month = months % 12;
    return '$year year${year != 1 ? 's' : ''}, $month month${month != 1 ? 's' : ''}';
  }

  String formatGrossAnnualIncome(double income) {
    return '${NumberFormat('\$#,##0').format(income)}/year';
  }

  String formatNextPayday(DateTime date) {
    String dayName = DateFormat('EEEE').format(date);
    String month = DateFormat('MMM').format(date);
    String year = DateFormat('yyyy').format(date);
    int day = date.day;

    String ordinalSuffix = getOrdinalSuffix(day);

    return '$month $day$ordinalSuffix, $year ($dayName)';
  }

  String formatDirectDeposit(DirectDeposit directDeposit) {
    return directDeposit == DirectDeposit.Yes ? 'Yes' : 'No';
  }

  String getOrdinalSuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th';
    }
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  void updateEmploymentType(String employmentType) {
    state = state.copyWith(employmentType: employmentType);
  }

  void updateEmployer(String employer) {
    state = state.copyWith(employer: employer);
  }

  void updateJobTitle(String jobTitle) {
    state = state.copyWith(jobTitle: jobTitle);
  }

  void updateGrossAnnualIncome(double grossAnnualIncome) {
    state = state.copyWith(grossAnnualIncome: grossAnnualIncome);
  }

  void updatePayFrequency(String payFrequency) {
    state = state.copyWith(payFrequency: payFrequency);
  }

  void updateEmployerAddress(String employerAddress) {
    state = state.copyWith(employerAddress: employerAddress);
  }

  void updateTimeWithEmployerYears(int years) {
    int totalMonths = years * 12 + (state.timeWithEmployer % 12);
    state = state.copyWith(timeWithEmployer: totalMonths);
  }

  void updateTimeWithEmployerMonths(int months) {
    int totalMonths = (state.timeWithEmployer ~/ 12) * 12 + months;
    state = state.copyWith(timeWithEmployer: totalMonths);
  }

  void updateNextPayDay(DateTime nextPayDay) {
    state = state.copyWith(nextPayDay: nextPayDay);
  }

  void updateDirectDeposit(DirectDeposit directDeposit) {
    state = state.copyWith(directDeposit: directDeposit);
  }
}
