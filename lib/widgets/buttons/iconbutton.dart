 import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  final String icon;
  final Color color;
  final VoidCallback onTap;
  final String text;
  final FontWeight fw;
  final Color textColor;
  final double font_s;
  final Color borderColor;

  const MyIconButton({super.key, required this.onTap, required this.text, required this.fw, required this.textColor, required this.font_s, required this.color, required this.borderColor, required this.icon, required double fontSize});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        width: size.width * 0.9,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          color: color,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Center(
          child: Row(  
            mainAxisAlignment: MainAxisAlignment.center,  
            children: <Widget>[
              Image.asset(icon, height: 24,),  
              const SizedBox(width: 10,),  
              Text(
                text,
                style: TextStyle(color: textColor,fontWeight: fw, fontSize:font_s,),
              ),
            ]
          ),
        ),
      ),
    );
  }
}
