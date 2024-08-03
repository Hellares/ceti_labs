import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextFieldV4 extends StatelessWidget {
  final String? label;
  final String? initialValue;
  final IconData? icon;
  final String? svgIconPath;
  final String? errorText;
  final Color? colorIcon;
  final Color? colorFont;
  final Color? colorLabel;
  final double? sizeIcon;
  final double? sizeFont;
  final Color? colorBorderFocus;
  final Color? colorBorder;
  final Function(String text) onChanged;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextStyle? style;
  final TextEditingController? controller;
  final bool? enabled;
  final double? height;
  final double? width;
  final String? hintText;

  const CustomTextFieldV4({
    Key? key,
    this.label,
    this.icon,
    required this.onChanged,
    this.svgIconPath,
    this.errorText,
    this.colorIcon = Colors.white,
    this.colorFont = const Color.fromARGB(221, 61, 61, 61),
    this.colorLabel = Colors.white,
    this.colorBorderFocus =  Colors.grey,
    this.colorBorder = Colors.grey,
    this.sizeIcon = 16,
    this.sizeFont = 16,
    this.validator,
    this.obscureText = false,
    this.initialValue,
    this.keyboardType = TextInputType.text,
    this.style,
    this.controller,
    this.enabled = true,
    this.height = 11.0,
    this.width,
    this.hintText,
  }) : super(key: key);

    @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      initialValue: controller == null ? initialValue : null,
      onChanged: onChanged,
      validator: validator,
      cursorColor: const Color.fromRGBO(0, 0, 0, 1),
      enabled: enabled,
      decoration: InputDecoration(
        isDense: true,
        label: Text(
          label?.isNotEmpty == true ? label! : ' ',
          style: TextStyle(
            color: colorLabel,
            fontSize: sizeFont,
            fontWeight: FontWeight.w700,
          ),
        ),
        hintText: hintText,
        errorText: errorText,
        prefixIcon: _buildPrefixIcon(),
        contentPadding: EdgeInsets.symmetric(
          vertical: height ?? 11,
          horizontal: width ?? 10,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorBorder!),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorBorderFocus!),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.redAccent),
          borderRadius: BorderRadius.circular(10),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      style: style ?? TextStyle(
        fontSize: sizeFont,
        fontWeight: FontWeight.bold,
        fontFamily: 'Araboto Normal 400',
        color: enabled ?? true ? colorFont : colorFont!.withOpacity(0.5),
      ),
      keyboardType: keyboardType,
      textInputAction: TextInputAction.done,
      onTap: () {
        if (!FocusScope.of(context).hasFocus) {
          FocusScope.of(context).requestFocus(FocusNode());
        }
      },
    );
  }

  Widget? _buildPrefixIcon() {
    if (icon != null) {
      return Icon(icon, color: colorIcon, size: sizeIcon);
    } else if (svgIconPath != null) {
      return Padding(
        padding: const EdgeInsets.all(11.0),
        child: SvgPicture.asset(
          svgIconPath!,
          height: sizeIcon,
          width: sizeIcon,
        ),
      );
    } else {
      return null;
    }
  }
}
