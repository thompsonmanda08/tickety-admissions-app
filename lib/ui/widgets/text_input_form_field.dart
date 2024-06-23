import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tickety_admission/values/colors.dart';

/// *  InputFieldName - Then name of the input field
/// *  textInputType - The type of information for which to optimize the text input control.
/// *  hintText - Text that suggests what sort of input the field accepts.
/// *  prefixIcon - Pass Icon if required
/// *  defaultText - If there is predefined value is there for a text field
/// *  focusNode - Currently focus node
/// *  obscureText - Is Password field?
/// *  controller - Text controller
/// *  functionValidate - Validation function(currently I have used to check empty field)
/// *  parametersValidate - Value to validate
/// *  actionKeyboard - Keyboard action eg. next, done, search, etc
/// *  onSubmitField - Done click action
/// *  onFieldTap - On focus on TextField

class CustomTextInputField extends StatelessWidget {
  final String inputFieldName;
  final String? hintText;
  final String? initialValue;
  final String? parametersValidate;
  final String labelText;
  final TextEditingController? controller;
  final TextInputAction? actionKeyboard;
  final TextAlign textAlign;
  final bool obscureText;
  final bool isEnabled;
  final bool showPrefixIcon;
  final Color cursorColor;
  final Color? inputTextColor;
  final Color? labelTextColor;
  final int? maxLength;
  final double marginY;
  final double marginX;
  final double? inputFontSize;
  final double? labelFontSize;
  final double paddingX;
  final double paddingY;
  final double? width;
  final double? height;
  final Function? functionValidate;
  final Function? onSubmitField;
  final Function? onFieldTap;
  final ValueChanged<String>? handleOnChanged;
  final FontWeight? inputFontWeight;
  final FontWeight? labelFontWeight;
  final TextInputType? textInputType;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final Offset prefixOffset;

  const CustomTextInputField({
    super.key,
    required this.inputFieldName,
    this.cursorColor = kPrimaryColor,
    this.hintText,
    this.focusNode,
    this.textInputType,
    this.initialValue,
    this.obscureText = false,
    this.isEnabled = true,
    this.showPrefixIcon = false,
    this.controller,
    this.labelText = "",
    this.functionValidate,
    this.parametersValidate,
    this.onSubmitField,
    this.onFieldTap,
    this.prefixIcon,
    this.handleOnChanged,
    this.maxLength,
    this.marginX = 0,
    this.marginY = 10,
    this.paddingX = 0,
    this.paddingY = 0,
    this.width,
    this.height = 60,
    this.textAlign = TextAlign.left,
    this.actionKeyboard = TextInputAction.next,
    this.prefixOffset = const Offset(0, 10),
    this.inputTextColor = neutralColor900,
    this.inputFontSize = 24,
    this.inputFontWeight = FontWeight.w700,
    this.labelTextColor = neutralColor600,
    this.labelFontSize = 20,
    this.labelFontWeight = FontWeight.w500,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: kPrimaryColor,
      ),
      child: TextFormField(
        controller: controller,
        initialValue: initialValue,
        showCursor: true,
        cursorHeight: 24,
        focusNode: focusNode,
        textInputAction: TextInputAction.next,
        enabled: isEnabled,
        textAlign: textAlign,
        onChanged: handleOnChanged,
        keyboardType: textInputType,
        obscureText: obscureText,
        style: TextStyle(
          color: inputTextColor,
          fontSize: inputFontSize,
          fontWeight: inputFontWeight,
        ),
        inputFormatters: [
          LengthLimitingTextInputFormatter(maxLength),
        ],
        decoration: InputDecoration(
          // border: const OutlineInputBorder(
          //   borderSide: BorderSide(color: neutralColor600),
          // ),

          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kPrimaryColor, width: 2),
              borderRadius: BorderRadius.circular(12)),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: kPrimaryColor.withOpacity(0.2), width: 2),
              borderRadius: BorderRadius.circular(12)),
          labelText: labelText,
          labelStyle: TextStyle(
            color: labelTextColor,
            fontSize: labelFontSize,
            fontWeight: FontWeight.w500,
          ),
          prefixIcon: showPrefixIcon
              ? Transform.translate(
                  offset: prefixOffset,
                  child: prefixIcon,
                )
              : null,
          contentPadding: const EdgeInsets.only(
            top: 18,
            // bottom: 0,
            left: 15,
            right: 15,
          ),
          isDense: true,
          errorStyle: const TextStyle(
            color: Colors.red,
            fontSize: 14,
            fontWeight: FontWeight.w300,
            fontStyle: FontStyle.normal,
            letterSpacing: 1.2,
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
        ),
        onTap: () {
          if (onFieldTap != null) onFieldTap!();
        },
      ),
    );
  }
}

String? commonValidation(String value, String messageError) {
  var required = requiredValidator(value, messageError);
  return required;
}

String? requiredValidator(value, messageError) {
  if (value.isEmpty) {
    return messageError;
  }
  return null;
}

void changeFocus(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
