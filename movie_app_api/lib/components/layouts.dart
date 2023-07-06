import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app_retry/api%20Integration/helper/movieHelper.dart';
import 'package:movie_app_retry/api%20Integration/model/movieModel.dart';
import 'package:movie_app_retry/components/functions.dart';
import 'package:movie_app_retry/constants/apiConstants.dart';

import '../pages/details.dart';

class layouts extends StatelessWidget {
  final movieType type;
  var movieObj = movieClass();
  int id;
  layouts({super.key, required this.type,this.id=0});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: movieObj.fetchMovie(type),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MovieModel>layoutData = snapshot.data?? [];
          return Container(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: layoutData.length,
              itemBuilder: (context, index) => Container(
                width: 90,
                child: InkResponse(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => details(movieData: layoutData[index]),)),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(7),
                        child: imageFunc(imgUrl+layoutData[index].posterPath, 120,width: 80),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: customText(layoutData[index].title.toString(),fontSz: 12),
                      ),
                      ratingBar(layoutData[index].voteAverage, 12)
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        return Center(child: CircularProgressIndicator(),);
      },
    );
  }
}