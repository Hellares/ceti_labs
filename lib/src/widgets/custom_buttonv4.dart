import 'package:flutter/material.dart';

class CustomButtonV4 extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color color1;
  final Color color2;
  final Color colortext;
  final double sizeFont;
  final double borderWidth;
  final List<Color> borderGradientColors;
  final BorderRadiusGeometry borderRadius;
  final double letterSpacing;
  final String fontFamily;
  final double height;
  final List<BoxShadow> boxShadow;

  const CustomButtonV4({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color1 = const Color.fromARGB(255, 7, 105, 95),
    this.color2 = Colors.teal,
    this.colortext = Colors.black,
    this.sizeFont = 18,
    this.borderWidth = 2.0,
    this.borderGradientColors = const [Colors.blue, Colors.purple],
    this.borderRadius = const BorderRadius.only(
      topLeft: Radius.circular(18),
      topRight: Radius.circular(18),
      bottomLeft: Radius.circular(18),
      bottomRight: Radius.circular(18),
    ),    
    this.letterSpacing = 1.0,
    this.fontFamily = 'Araboto Normal 400',
    this.height = 45,
    this.boxShadow = const [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 5,
        offset: Offset(0, 4),
      )
    ],
  }) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(      
      height: height,
      
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        gradient: LinearGradient(colors: borderGradientColors),
        boxShadow: boxShadow
      ),
      //padding: EdgeInsets.all(borderWidth),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          gradient: LinearGradient(colors: [color1, color2]),
        ),
        child: ClipRRect(
          borderRadius: borderRadius,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onPressed,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  text,
                  style: TextStyle(
                    color: colortext,
                    fontSize: sizeFont,
                    fontFamily: fontFamily,
                    fontWeight: FontWeight.w600,
                    letterSpacing: letterSpacing,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
