import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:meetmax/res/assets/image_assets.dart';
import 'package:meetmax/res/colors/app_colors.dart';
import 'package:meetmax/res/fonts/app_fonts.dart';

class LanguageDropdownButton extends StatefulWidget {
  @override
  _LanguageDropdownButtonState createState() => _LanguageDropdownButtonState();
}

class _LanguageDropdownButtonState extends State<LanguageDropdownButton> {
  String? selectedLanguage = "English (UK)"; // Set default to English
  final List<String> languages = [
    "English (UK)",
    "English (US)",
    "Spanish",
    "French",
    "German",
    "Bangla"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          hint: Text(
            'Language',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.hintColor,
            ),
          ),
          items: languages
              .map((language) => DropdownMenuItem<String>(
                    value: language,
                    child: Text(
                      language,
                      style: TextStyle(
                          fontSize: 12,
                          color: AppColors.hintColor,
                          fontFamily: AppFonts.robotoRegular),
                    ),
                  ))
              .toList(),
          value: selectedLanguage,
          onChanged: (value) {
            setState(() {
              selectedLanguage = value as String?;
            });
          },
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.only(left: 10, right: 10),
            height: 40,
            width: 110,
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              color: Colors.white, // Background color of dropdown
              borderRadius: BorderRadius.circular(8), // Rounded corners
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
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
