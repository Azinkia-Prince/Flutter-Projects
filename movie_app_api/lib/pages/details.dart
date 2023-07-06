import 'package:flutter/material.dart';
import 'package:movie_app_retry/api%20Integration/helper/movieHelper.dart';
import 'package:movie_app_retry/api%20Integration/model/movieModel.dart';
import 'package:movie_app_retry/components/layouts.dart';

class details extends StatelessWidget {
  const details({super.key,required this.movieData});
  final MovieModel movieData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        centerTitle: true,
      ),
      body: layouts(type: movieType.Similar,id: movieData.id),
    );
  }
}