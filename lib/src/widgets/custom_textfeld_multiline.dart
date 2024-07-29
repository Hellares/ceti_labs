import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextFieldMultiline extends StatelessWidget {
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
  final int? maxLines; // Nuevo parámetro para múltiples líneas

  const CustomTextFieldMultiline({
    Key? key,
    this.label = '',
    this.icon,
    required this.onChanged,
    this.svgIconPath,
    this.errorText,
    this.colorIcon = Colors.white,
    this.colorFont = const Color.fromARGB(221, 61, 61, 61),
    this.colorLabel = Colors.white,
    this.colorBorderFocus = Colors.grey,
    this.colorBorder = Colors.grey,
    this.sizeIcon = 16,
    this.sizeFont = 16,
    this.validator,
    this.obscureText = false,
    this.initialValue,
    this.keyboardType,
    this.style,
    this.controller,
    this.enabled = true,
    this.height = 11.0,
    this.width,
    this.maxLines = 1, // Por defecto, una línea
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
      maxLines: maxLines, // Usar el nuevo parámetro maxLines
      decoration: InputDecoration(
        isDense: true,
        // label: Text(
        //   label?.isNotEmpty == true ? label! : ' ',
        //   style: TextStyle(
        //     color: colorLabel,
        //     fontSize: sizeFont,
        //     fontWeight: FontWeight.w700,
        //   ),
        // ),
        errorText: errorText,
        prefixIcon: _buildPrefixIcon(),
        contentPadding: EdgeInsets.symmetric(
          vertical: maxLines == 1 ? height ?? 11 : 15, // Ajustar el padding vertical si es multilinea
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
      keyboardType: maxLines == 1 ? keyboardType : TextInputType.multiline, // Cambiar el tipo de teclado si es multilinea
      textInputAction: maxLines == 1 ? TextInputAction.done : TextInputAction.newline, // Cambiar la acción del teclado si es multilinea
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