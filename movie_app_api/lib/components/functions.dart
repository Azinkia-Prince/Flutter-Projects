import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

//Image Function

CachedNetworkImage imageFunc(String location, double height, {double? width}) {
  return CachedNetworkImage(
    imageUrl: location,
    height: height,
    width: width,
    placeholder: (context, url) => Center(
      child: CircularProgressIndicator(),
    ),
    errorWidget: (context, url, error) => Center(
      child: Icon(Icons.error),
    ),
  );
}

SizedBox gap({double? height, double? width}) {
  return SizedBox(
    height: height,
    width: width,
  );
}

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

Padding headingText(String text) {
  return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: TextStyle(
          color: Color.fromARGB(255, 31, 30, 30),
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ));
}

//Rating Bar

Row ratingBar(location, double size) {
  return Row(
    children: [
      RatingBarIndicator(
        itemCount: 5,
        itemSize: size,
        itemBuilder: (context, index) => Icon(
          Icons.star,
          color: Colors.amber,
        ),
        direction: Axis.horizontal,
        rating: location / 2,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: customText(
          location.toString(),
          fontSz: size,
        ),
      )
    ],
  );
}
