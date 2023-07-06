import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_retry/api%20Integration/helper/movieHelper.dart';
import 'package:movie_app_retry/api%20Integration/model/movieModel.dart';
import 'package:movie_app_retry/components/functions.dart';
import 'package:movie_app_retry/constants/apiConstants.dart';

class Carousel extends StatelessWidget {

  var movieObj = movieClass();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: movieObj.fetchMovie(movieType.nowPlaying),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MovieModel>movieData = snapshot.data  ?? [];
          return CarouselSlider.builder(
            itemCount: movieData.length, 
            itemBuilder: (context, index, realIndex) => ClipRRect(
              child: imageFunc(imgUrl+movieData[index].posterPath, 120)
            ), 
            options: CarouselOptions(
              autoPlay: true,
              height: 120
            )
          );
        }
        return Center(child: CircularProgressIndicator(),);
      },
    );
  }
}