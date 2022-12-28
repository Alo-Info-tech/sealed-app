
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingsTextFormField extends StatelessWidget {
  final String? hintText;
  final double? fontSize;
  final String? initialValue;
  final bool? autoFocus;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String value)? onChanged;
  final Function? validator;
  final TextEditingController? controller;
  final IconData? suffixIcon;

  const SettingsTextFormField(
      {Key? key,
      @required this.hintText,
      this.onChanged,
      this.initialValue,
      this.fontSize = 18,
      this.autoFocus = false,
      this.keyboardType = TextInputType.text,
      this.textCapitalization,
      this.inputFormatters,
      this.validator,
      this.suffixIcon,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 0,
      ),
      child: TextFormField(
      //  validator: validator,
        controller: controller,
        autocorrect: false,
        textCapitalization: textCapitalization ?? TextCapitalization.words,
        keyboardType: keyboardType,
        //cursorColor: AlikeColors.COLOR_ALIKE_BLACK,
        textAlign: TextAlign.start,
        //autofocus: autoFocus,
        initialValue: initialValue,
        style: TextStyle(
          fontSize: fontSize,
        ),
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: new Icon(suffixIcon),
          border: InputBorder.none,
          hintStyle: TextStyle(
            fontSize: fontSize,
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
