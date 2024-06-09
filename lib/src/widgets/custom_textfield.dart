import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String? initialValue;
  final IconData icon;
  final String? errorText;
  final Color? colorIcon;
  final Color? colorFont;
  final Color? colorLabel;
  final double? size;
  final Function(String text) onChanged;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextStyle? style;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.icon,
    required this.onChanged, 
    this.errorText,
    this.colorIcon = Colors.white,
    this.colorFont = Colors.orange,
    this.colorLabel = Colors.white,
    this.size = 16,
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
      onChanged: (text){
        onChanged(text);
      },
      validator: validator,
      cursorColor: const Color.fromRGBO(0, 0, 0, 1),
      decoration: InputDecoration(
        isDense: true,
        label: Text(
          label,
          style: TextStyle(color: colorLabel,fontSize: size, fontWeight: FontWeight.w700),
        ),
        errorText: errorText,
        prefixIcon: Icon(icon,color: colorIcon, size: size),
        enabledBorder:
            const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: colorIcon!)),
      ),
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: colorFont
      ), 
      keyboardType: keyboardType,
      //inputFormatters: (keyboardType == TextInputType.number) ? [FilteringTextInputFormatter.digitsOnly] : null,     
    );
  }
}
