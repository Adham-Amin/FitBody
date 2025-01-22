import 'package:fitbody/core/utils/styles.dart';
import 'package:flutter/material.dart';

class GenderSelection extends StatefulWidget {
  const GenderSelection({
    super.key,
    required this.initialGender,
    required this.onChanged,
  });

  final String initialGender;
  final ValueChanged<String> onChanged;

  @override
  GenderSelectionState createState() => GenderSelectionState();
}

class GenderSelectionState extends State<GenderSelection> {
  late String selectedGender;

  @override
  void initState() {
    super.initState();
    selectedGender = widget.initialGender;
  }

  void _handleGenderChange(String? value) {
    setState(() {
      selectedGender = value!;
    });
    widget.onChanged(selectedGender);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gender',
          style: Styles.textNormal14(context).copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: ListTile(
                title: Text(
                  'Male',
                  style: Styles.textLight16(context)
                      ,
                ),
                leading: Radio<String>(
                  value: 'Male',
                  groupValue: selectedGender,
                  onChanged: _handleGenderChange,
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: Text(
                  'Female',
                  style: Styles.textLight16(context),
                ),
                leading: Radio<String>(
                  value: 'Female',
                  groupValue: selectedGender,
                  onChanged: _handleGenderChange,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
