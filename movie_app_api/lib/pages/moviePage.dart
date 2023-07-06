import 'package:flutter/material.dart';
import 'package:movie_app_retry/api%20Integration/helper/movieHelper.dart';
import 'package:movie_app_retry/components/functions.dart';
import 'package:movie_app_retry/components/layouts.dart';
import 'package:movie_app_retry/components/slider.dart';

class moviePage extends StatelessWidget {
  const moviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TMDB - Movie"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Carousel(),
            Padding(
              padding: const EdgeInsets.only(left: 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  headingText("Popular"),
                  layouts(type: movieType.popular),
                  headingText("Upcoming"),
                  layouts(type: movieType.upcoming),
                  headingText("Top Rated"),
                  layouts(type: movieType.topRated),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}