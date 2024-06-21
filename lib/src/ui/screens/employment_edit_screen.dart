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
    final employment = ref.watch(employmentNotifierProvider);

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
          padding: AppPadding.horizontalMedium,
          children: [
            Text('Edit employment information',
                style: AppTextStyles.displayLarge
                    .copyWith(fontSize: 40, fontFamily: 'AtSlamCndTRIAL')),
            AppGaps.vMedGap,
            /* Text('Employment Type', style: AppTextStyles.titleSmall),
            _buildDropdownField(
              value: employment.employmentType,
              items: [
                'Full-time',
                'Part-time',
                'Temporary',
                'Apprenticeship',
                'Freelance'
              ],
              onChanged: (value) => ref
                  .read(employmentNotifierProvider.notifier)
                  .updateEmploymentType(value!),
            ), */

            Text('Employment type',
                style: AppTextStyles.bodyLarge.copyWith(
                    fontWeight: FontWeight.bold, color: Palette.darkPurple)),
            _buildTextField(
              initialValue: employment.employer,
              onChanged: (value) => ref
                  .read(employmentNotifierProvider.notifier)
                  .updateEmployer(value),
            ),
            /* Text('Job Title', style: AppTextStyles.titleSmall),
            _buildTextField(
              initialValue: employment.jobTitle,
              onChanged: (value) => ref
                  .read(employmentNotifierProvider.notifier)
                  .updateJobTitle(value),
            ),
            Text('Gross Annual Income', style: AppTextStyles.titleSmall),
            _buildTextField(
              initialValue: employment.grossAnnualIncome.toString(),
              onChanged: (value) => ref
                  .read(employmentNotifierProvider.notifier)
                  .updateGrossAnnualIncome(double.parse(value)),
              keyboardType: TextInputType.number,
            ),
            Text('Pay Frequency', style: AppTextStyles.titleSmall),
            _buildDropdownField(
              value: employment.payFrequency,
              items: ['Weekly', 'Bi-weekly', 'Monthly'],
              onChanged: (value) => ref
                  .read(employmentNotifierProvider.notifier)
                  .updatePayFrequency(value!),
            ),
            Text('Employer Address', style: AppTextStyles.titleSmall),
            _buildTextField(
              initialValue: employment.employerAddress,
              onChanged: (value) => ref
                  .read(employmentNotifierProvider.notifier)
                  .updateEmployerAddress(value),
              maxLines: 3,
            ),
            Text('Time with Employer', style: AppTextStyles.titleSmall),
            _buildTimeWithEmployerFields(employment),
            Text('Next Pay Day', style: AppTextStyles.titleSmall),
            _buildDatePickerField(
              selectedDate: employment.nextPayDay,
              onDateSelected: (date) => ref
                  .read(employmentNotifierProvider.notifier)
                  .updateNextPayDay(date),
            ),
            Text('Direct Deposits', style: AppTextStyles.titleSmall),
            _buildRadioGroupField(
              value: employment.directDeposit,
              onChanged: (value) => ref
                  .read(employmentNotifierProvider.notifier)
                  .updateDirectDeposit(value!),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Form is valid, proceed with saving data
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Form submitted successfully')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
         */
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.all(16.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(color: Colors.blue),
      ),
    );
  }

  Widget _buildDropdownField({
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        decoration: _inputDecoration(),
        value: value,
        onChanged: onChanged,
        items: items.map((item) {
          return DropdownMenuItem(
            value: item,
            child: Text(item),
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: _buildDropdownField(
              value: (employment.timeWithEmployer ~/ 12).toString(),
              items: List.generate(21, (index) => index.toString()),
              onChanged: (value) => ref
                  .read(employmentNotifierProvider.notifier)
                  .updateTimeWithEmployerYears(int.parse(value!)),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _buildDropdownField(
              value: (employment.timeWithEmployer % 12).toString(),
              items: List.generate(12, (index) => index.toString()),
              onChanged: (value) => ref
                  .read(employmentNotifierProvider.notifier)
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: _inputDecoration(),
        readOnly: true,
        controller:
            TextEditingController(text: DateFormat.yMd().format(selectedDate)),
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime(2000),
            lastDate: DateTime(2101),
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RadioListTile<DirectDeposit>(
            title: const Text('Yes'),
            value: DirectDeposit.Yes,
            groupValue: value,
            onChanged: onChanged,
          ),
          RadioListTile<DirectDeposit>(
            title: const Text('No'),
            value: DirectDeposit.No,
            groupValue: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
