import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconCustomBack extends StatelessWidget{

  final Color? color;
  final String? svgPath;
  final IconData? icon;

  const IconCustomBack({super.key, 

    this.color = Colors.white,
    this.svgPath,
    this.icon
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(      
     // color: Colors.green,
      height: 55,
      width: 35,
      alignment: Alignment.centerLeft,
      child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: svgPath != null
            ? SvgPicture.asset(
                svgPath!,// Optional color overlay for the SVG
                //height: 70,
                //width: 50,
              )
            :Icon(              
            Icons.arrow_back_ios,
            color: color,
            size: 25,
          )
        ),
        
    );
    
  }
}