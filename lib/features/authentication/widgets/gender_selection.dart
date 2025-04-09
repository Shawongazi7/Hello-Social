import 'package:flutter/material.dart';
import 'package:meetmax/res/assets/image_assets.dart';
import 'package:meetmax/res/colors/app_colors.dart';
import 'package:meetmax/res/fonts/app_fonts.dart';

class GenderSelection extends StatefulWidget {
  final Function(String) onGenderSelected;

  const GenderSelection({Key? key, required this.onGenderSelected})
      : super(key: key);

  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  String _selectedGender = 'Male';

  @override
  void initState() {
    super.initState();
    // Set default gender to "Male" and trigger the callback
    widget.onGenderSelected(_selectedGender);
  }

  void _onGenderChanged(String? value) {
    setState(() {
      _selectedGender = value!;
    });
    widget.onGenderSelected(value!);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Image.asset(
              _selectedGender == 'Male'
                  ? ImageAssets.maleIcon
                  : ImageAssets.femaleIcon,
              width: 16,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 10),
            Row(
              children: [
                Radio<String>(
                  activeColor: AppColors.blue,
                  value: 'Male',
                  groupValue: _selectedGender,
                  onChanged: _onGenderChanged,
                ),
                Text(
                  'Male',
                  style: TextStyle(
                    color: _selectedGender == 'Male'
                        ? AppColors.black87
                        : AppColors.black54,
                    fontSize: 14,
                    fontFamily: AppFonts.robotoRegular,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(width: 10),
                Radio<String>(
                  activeColor: AppColors.blue,
                  value: 'Female',
                  groupValue: _selectedGender,
                  onChanged: _onGenderChanged,
                ),
                Text(
                  'Female',
                  style: TextStyle(
                    color: _selectedGender == 'Female'
                        ? AppColors.black87
                        : AppColors.black54,
                    fontSize: 14,
                    fontFamily: AppFonts.robotoRegular,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
