import 'package:flutter/material.dart';

abstract class AppStyles {
  static const displayLarge = TextStyle(
    fontFamily: 'Montserrat_Alternates',
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Color(0xffFFFFFF),
  );
  static const cardText = TextStyle(
    fontFamily: 'Montserrat_Alternates',
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: Color(0xffFFFFFF),
  );
  static const cardTextLined = TextStyle(
    fontFamily: 'Montserrat_Alternates',
    fontSize: 12,
    decoration: TextDecoration.lineThrough,
    decorationColor: Color(0xffFFFFFF),
    fontWeight: FontWeight.w500,
    color: Color(0xffFFFFFF),
  );

  static const policyText = TextStyle(
    color: Colors.grey,
    fontFamily: 'Montserrat_Alternates',
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
}
