import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../src.dart';

class EmploymentEditScreen extends ConsumerStatefulWidget {
  const EmploymentEditScreen({Key? key}) : super(key: key);

  @override
  EmploymentEditScreenState createState() => EmploymentEditScreenState();
}

class EmploymentEditScreenState extends ConsumerState<EmploymentEditScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final employmentProvider = ref.watch(employmentNotifierProvider);
    final employmentNotifier = ref.read(employmentNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Custom back icon
          onPressed: () {
            GoRouter.of(context).push('/emp_disp');
          },
        ),
        backgroundColor: Palette.lightGrey,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          padding: AppPadding.horizontalMedium,
          children: [
            Text('Edit employment information',
                style: AppTextStyles.displayLarge
                    .copyWith(fontSize: 40, fontFamily: 'AtSlamCndTRIAL')),
            AppGaps.vMedGap,
            _labelText(text: 'Employment Type'),
            _buildDropdownField(
              value: employmentProvider.employmentType,
              items: employmentNotifier.employmentTypeItems,
              onChanged: (value) =>
                  employmentNotifier.updateEmploymentType(value!),
            ),
            _labelText(text: 'Employer'),
            _buildTextField(
              initialValue: employmentProvider.employer,
              onChanged: (value) => employmentNotifier.updateEmployer(value),
            ),
            _labelText(text: 'Job title'),
            _buildTextField(
              initialValue: employmentProvider.jobTitle,
              onChanged: (value) => employmentNotifier..updateJobTitle(value),
            ),
            _labelText(text: 'Gross annual income'),
            _buildTextField(
              initialValue: employmentProvider.grossAnnualIncome.toString(),
              onChanged: (value) => employmentNotifier
                  .updateGrossAnnualIncome(double.parse(value)),
              keyboardType: TextInputType.number,
            ),
            _labelText(text: 'Pay frequency'),
            _buildDropdownField(
              value: employmentProvider.payFrequency,
              items: employmentNotifier.payFrequencyItems,
              onChanged: (value) =>
                  employmentNotifier.updatePayFrequency(value!),
            ),
            _labelText(text: 'Next Pay Day'),
            _buildDatePickerField(
              selectedDate: employmentProvider.nextPayDay,
              onDateSelected: (date) =>
                  employmentNotifier.updateNextPayDay(date),
            ),
            _labelText(text: 'Is your pay a direct deposit?'),
            _buildRadioGroupField(
              value: employmentProvider.directDeposit,
              onChanged: (value) =>
                  employmentNotifier.updateDirectDeposit(value!),
            ),
            _labelText(text: 'Employer Address'),
            _buildTextField(
              initialValue: employmentProvider.employerAddress,
              onChanged: (value) =>
                  employmentNotifier.updateEmployerAddress(value),
              maxLines: 3,
            ),
            _labelText(text: 'Time with Employer'),
            _buildTimeWithEmployerFields(employmentProvider),
            AppGaps.vHugeGap,
            AppGaps.vHugeGap,
            ElevatedTextButton(
                buttonData: ElevetedTextButtonModel(
              padding: AppPadding.verticalLarge,
              text: 'Continue',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Form is valid, proceed with saving data
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Form submitted successfully')),
                  );
                }
              },
              backgroundColor: Palette.lightGreyShade,
              //borderColor: borderColor,
              textColor: AppColor.darkPurple,
            ))
          ],
        ),
      ),
    );
  }

  Text _labelText({required String text}) {
    return Text(text,
        style: AppTextStyles.bodyLarge
            .copyWith(fontWeight: FontWeight.bold, color: Palette.darkPurple));
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      contentPadding: AppPadding.allMedium,
      enabledBorder: const OutlineInputBorder(
        borderRadius: AppBorderRadius.card,
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: Palette.deepPurple),
      ),
    );
  }

  Widget _buildDropdownField({
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Padding(
      padding: AppPadding.verticalSmall,
      child: DropdownButtonFormField<String>(
        dropdownColor: Palette.lightGrey,
        icon: const Icon(Icons.expand_more),
        decoration: _inputDecoration()
            .copyWith(contentPadding: AppPadding.horizontalLarge),
        value: value,
        onChanged: onChanged,
        items: items.map((item) {
          return DropdownMenuItem(
            value: item,
            child: SizedBox(child: Text(item)),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTextField({
    required String initialValue,
    required ValueChanged<String> onChanged,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: _inputDecoration(),
        initialValue: initialValue,
        onChanged: onChanged,
        keyboardType: keyboardType,
        maxLines: maxLines,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field is required';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildTimeWithEmployerFields(Employment employment) {
    final employmentNotifier = ref.read(employmentNotifierProvider.notifier);
    return Padding(
      padding: AppPadding.allSmall,
      child: Row(
        children: [
          Expanded(
            child: _buildDropdownField(
              value: (employment.timeWithEmployer ~/ 12).toString(),
              items: List.generate(11, (index) => index.toString()),
              onChanged: (value) => employmentNotifier
                  .updateTimeWithEmployerYears(int.parse(value!)),
            ),
          ),
          AppGaps.hSmallGap,
          Expanded(
            child: _buildDropdownField(
              value: (employment.timeWithEmployer % 12).toString(),
              items: List.generate(11, (index) => (index + 1).toString()),
              onChanged: (value) => employmentNotifier
                  .updateTimeWithEmployerMonths(int.parse(value!)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDatePickerField({
    required DateTime selectedDate,
    required ValueChanged<DateTime> onDateSelected,
  }) {
    DateTime now = DateTime.now();
    DateTime lastDate = DateTime(now.year, now.month + 1, now.day);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration:
            _inputDecoration().copyWith(suffixIcon: Icon(Icons.calendar_month)),
        readOnly: true,
        controller: TextEditingController(
            text: DateFormat.yMMMEd().format(selectedDate)),
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: selectedDate,
            lastDate: lastDate,
          );
          if (pickedDate != null && pickedDate != selectedDate) {
            onDateSelected(pickedDate);
          }
        },
      ),
    );
  }

  Widget _buildRadioGroupField({
    required DirectDeposit value,
    required ValueChanged<DirectDeposit?> onChanged,
  }) {
    return Row(
      //direction: Axis.horizontal,
      children: [
        Expanded(
          child: RadioListTile<DirectDeposit>(
            //fillColor: Palette.white,
            activeColor: Palette.deepPurple,
            title: const Text('Yes'),
            value: DirectDeposit.Yes,
            groupValue: value,
            onChanged: onChanged,
          ),
        ),
        Expanded(
          child: RadioListTile<DirectDeposit>(
            activeColor: Palette.deepPurple,
            title: const Text('No'),
            value: DirectDeposit.No,
            groupValue: value,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
