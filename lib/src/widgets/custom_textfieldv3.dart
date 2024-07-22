import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextFieldV3 extends StatelessWidget {
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
  final TextEditingController? controller;
  final bool? enabled;
  final double? height;
  final double? width;

  const CustomTextFieldV3({
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
    this.controller,
    this.enabled = true,
    this.height = 11.0,
    this.width
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      initialValue: initialValue,
      onChanged: (text) {
        onChanged(text);
      },
      validator: validator,
      cursorColor: const Color.fromRGBO(0, 0, 0, 1),
      enabled: enabled,
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
        contentPadding: EdgeInsets.symmetric(vertical: height ?? 11, horizontal: width ?? 10), // Ajusta el padding -- altura de la caja texto
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromARGB(255, 61, 61, 61)),
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
        disabledBorder: OutlineInputBorder( // Add this for maintaining border design when disabled
          borderSide: BorderSide(color: const Color.fromARGB(255, 0, 0, 0).withOpacity(1)), // Set your preferred color
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      style: TextStyle(
        fontSize: sizeFont,
        fontWeight: FontWeight.bold,
        color: enabled ?? true ? colorFont : colorFont!.withOpacity(1), // Change text color if disabled,
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