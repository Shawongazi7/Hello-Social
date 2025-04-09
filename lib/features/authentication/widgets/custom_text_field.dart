import 'package:flutter/material.dart';
import 'package:meetmax/res/assets/image_assets.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Color borderColor;
  final TextStyle textStyle;
  final Color backgroundColor;
  final double width;
  final double height;
  final Widget? icon;
  final bool? showPassword;
  final bool textEditingEnabled;
  final List<String>? iconPaths;
  final List<VoidCallback>?
      iconActions;

  const CustomTextField({
    super.key,
    this.hintText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.borderColor = Colors.grey,
    this.textStyle = const TextStyle(),
    this.width = double.infinity,
    this.height = 56.0,
    this.icon,
    this.showPassword = false,
    this.backgroundColor = Colors.transparent,
    this.textEditingEnabled = false,
    this.iconPaths, // Initialize iconPaths here
    this.iconActions, // Initialize iconActions here
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isPasswordHidden;

  @override
  void initState() {
    super.initState();
    isPasswordHidden = widget.obscureText;
  }

  void togglePasswordVisibility() {
    setState(() {
      isPasswordHidden = !isPasswordHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        border: Border.all(color: widget.borderColor),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          if (widget.icon != null)
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: widget.icon,
            ),
          Expanded(
            child: Container(
              color: widget.backgroundColor,
              child: TextFormField(
                readOnly: widget.textEditingEnabled,
                controller: widget.controller,
                keyboardType: widget.keyboardType,
                obscureText: isPasswordHidden,
                validator: widget.validator,
                style: widget.textStyle,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: widget.textStyle.copyWith(color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 11.0,
                  ),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (widget.showPassword == true)
                        GestureDetector(
                          onTap: togglePasswordVisibility,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              isPasswordHidden
                                  ? ImageAssets.hidePasswordIcon
                                  : ImageAssets.showPasswordIcon,
                              width: 16,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      if (widget.iconPaths != null)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children:
                              List.generate(widget.iconPaths!.length, (index) {
                            return InkWell(
                              onTap: widget.iconActions != null &&
                                      widget.iconActions!.length > index
                                  ? widget.iconActions![index]
                                  : null,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Image.asset(
                                  widget.iconPaths![index],
                                  width: 16,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            );
                          }),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
