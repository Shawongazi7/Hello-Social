import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:meetmax/res/assets/image_assets.dart';
import 'package:meetmax/res/colors/app_colors.dart';
import 'package:meetmax/res/fonts/app_fonts.dart';

class PrivacyDropdownButton extends StatefulWidget {
  @override
  _PrivacyDropdownButtonState createState() => _PrivacyDropdownButtonState();
}

class _PrivacyDropdownButtonState extends State<PrivacyDropdownButton> {
  String? selectedPrivacy = "Public"; // Set default to Friends
  final List<String> privacies = [
    "Public",
    "Private",
    "Friends",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(4),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          hint: Text(
            'Privacy',
            style: TextStyle(
              fontSize: 8,
              color: AppColors.blue,
            ),
          ),
          items: privacies
              .map((language) => DropdownMenuItem<String>(
                    value: language,
                    child: Text(
                      language,
                      style: TextStyle(
                          fontSize: 8,
                          color: AppColors.blue,
                          fontFamily: AppFonts.robotoRegular),
                    ),
                  ))
              .toList(),
          value: selectedPrivacy,
          onChanged: (value) {
            setState(() {
              selectedPrivacy = value as String?;
            });
          },
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 30,
            width: 90,
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              color: Colors.white, // Background color of dropdown
              borderRadius: BorderRadius.circular(8), // Rounded corners
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
          ),
          iconStyleData: IconStyleData(
            icon: Image.asset(ImageAssets.dropDownIcon,
                width: 10, height: 10, color: AppColors.hintColor),
          ),
        ),
      ),
    );
  }
}
