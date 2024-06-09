import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget{
  final String text;
  final Function() onPressed;
  final Color color1;
  final Color color2;
  final Color colortext;
  final double sizeFont;
  final Color borderColor;
  final double borderWidth;

  const CustomButtom({super.key, 
    required this.text,
    required this.onPressed,
    this.color1 = const Color.fromARGB(255, 7, 105, 95),
    this.color2 = Colors.teal,
    this.colortext = Colors.black,
    this.sizeFont = 18,
    this.borderColor = Colors.teal,
    this.borderWidth = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),        
        gradient: LinearGradient(colors: [color1, color2])
      ),
      child: ElevatedButton(
        onPressed: (){
          onPressed();
        },                            
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
            side: BorderSide(color: borderColor, width: borderWidth),
          ),
        ),
        child: Text(text,
          style: TextStyle(
            color: colortext,
            fontSize: sizeFont,
            fontWeight: FontWeight.w800
          ),),
      ),
    );
  }

}