import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Text customText(String text,
    {TextAlign align = TextAlign.justify,
    Color? color,
    double? fontSz,
    FontWeight? fontWd,
    double? lineHeight}) {
  return Text(
    text,
    maxLines: 1,
    textAlign: align,
    style: TextStyle(
        color: color,
        fontSize: fontSz,
        fontWeight: fontWd,
        height: lineHeight,
        overflow: TextOverflow.ellipsis),
  );
}

Padding headingText(String text,{double? size}) {
  return Padding(
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: size,
          fontWeight: FontWeight.bold,
        ),
      ));
}
