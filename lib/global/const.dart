import 'package:flutter/material.dart';

// Colors
const Color purple = Color.fromRGBO(100, 0, 205, 1); 
const Color white = Color.fromRGBO(255,255,255,1);
const Color black = Color.fromRGBO(0,0,0,1);
const Color grey1 = Color.fromRGBO(39, 37, 46, 1);
const Color grey2 = Color.fromRGBO(96, 93, 103, 1);

// Weight
const FontWeight w400 = FontWeight.w400;
const FontWeight w500 = FontWeight.w500;
const FontWeight w600 = FontWeight.w600;
const FontWeight w700 = FontWeight.w700;

// EdgeInsets
const EdgeInsets a5 = EdgeInsets.all(5);
const EdgeInsets a10 = EdgeInsets.all(10);
const EdgeInsets a16 = EdgeInsets.all(16);
const EdgeInsets lr16 = EdgeInsets.only(left: 16, right: 16);
const EdgeInsets tb10 = EdgeInsets.only(top:10, bottom: 10);
const EdgeInsets t40 = EdgeInsets.only(top:40);

// TextStyle
const TextStyle bf32w4 = TextStyle(color: black, fontSize: 32, fontWeight: w400, fontFamily: 'roboto');
const TextStyle bf16w6 = TextStyle(color: black, fontSize: 16, fontWeight: w600, fontFamily: 'roboto');
const TextStyle bf16w4 = TextStyle(color: black, fontSize: 16, fontWeight: w400, fontFamily: 'roboto');
const TextStyle bf14w4 = TextStyle(color: black, fontSize: 14, fontWeight: w400, fontFamily: 'roboto');
const TextStyle bf12w4 = TextStyle(color: black, fontSize: 12, fontWeight: w400, fontFamily: 'roboto');
const TextStyle bf14w6 = TextStyle(color: black, fontSize: 14, fontWeight: w600, fontFamily: 'roboto');
const TextStyle wf16w6 = TextStyle(color: white, fontSize: 16, fontWeight: w600, fontFamily: 'roboto');
const TextStyle bf20w7 = TextStyle(color: black, fontSize: 20, fontWeight: w700, fontFamily: 'roboto');
const TextStyle g2f14w4 = TextStyle(color: grey2, fontSize: 14, fontWeight: w400, fontFamily: 'roboto');
const TextStyle g1f16w4 = TextStyle(color: grey1, fontSize: 16, fontWeight: w400, fontFamily: 'roboto');
const TextStyle g1f24w7 = TextStyle(color: grey1, fontSize: 24, fontWeight: w700, fontFamily: 'roboto');

// ButtonStyle
const ButtonStyle purpleButton = ButtonStyle(backgroundColor: MaterialStatePropertyAll(purple));

// MainAxisAlignment
const MainAxisAlignment str = MainAxisAlignment.start;
const MainAxisAlignment cnt = MainAxisAlignment.center;
const MainAxisAlignment spb = MainAxisAlignment.spaceBetween;
const MainAxisAlignment spa = MainAxisAlignment.spaceAround;

// CrossAxisAlignment
const CrossAxisAlignment start = CrossAxisAlignment.start;
const CrossAxisAlignment center = CrossAxisAlignment.center;

// Alignment
const Alignment centerAlig = Alignment.center;