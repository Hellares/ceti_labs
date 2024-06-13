import 'package:flutter/material.dart';

class CustomGradientText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Gradient gradient;

  const CustomGradientText({
    Key? key,
    required this.text,
    required this.style,
    required this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return gradient.createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height));
      },
      child: Text(
        text,
        style: style.copyWith(color: Colors.white),  // Color blanco para asegurar que el degradado se vea correctamente
      ),
    );
  }
}
// Luego, cuando uses el CustomGradientText, define los estilos y gradientes según el rol:
