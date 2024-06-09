import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextFieldV2 extends StatelessWidget {
  final String label;
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
  final Function(String text) onChanged;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextStyle? style;

  const CustomTextFieldV2({
    Key? key,
    required this.label,
    this.icon,
    required this.onChanged, 
    this.svgIconPath,
    this.errorText,
    this.colorIcon = Colors.white,
    this.colorFont = Colors.orange,
    this.colorLabel = Colors.white,
    this.colorBorderFocus = Colors.black,
    this.sizeIcon = 16,
    this.sizeFont = 16,


    this.validator,
    this.obscureText = false, 
    this.initialValue,
    this.keyboardType = TextInputType.text,  
    this.style, 
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      initialValue: initialValue,
      onChanged: (text) {
        onChanged(text);
      },
      validator: validator,
      cursorColor: const Color.fromRGBO(0, 0, 0, 1),
      decoration: InputDecoration(
        isDense: true,
        label: Text(
          label,
          style: TextStyle(
            color: colorLabel,
            fontSize: sizeFont,
            fontWeight: FontWeight.w700
          ),
        ),
        errorText: errorText,
        //prefixIcon: Icon(icon, color: colorIcon, size: sizeIcon),
        prefixIcon: _buildPrefixIcon(),
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10.0), // Ajusta el padding
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromARGB(255, 61, 61, 61)),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorBorderFocus!),
          borderRadius: BorderRadius.circular(8.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.redAccent),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      style: TextStyle(
        fontSize: sizeFont,
        fontWeight: FontWeight.bold,
        color: colorFont,
      ),
      keyboardType: keyboardType,
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