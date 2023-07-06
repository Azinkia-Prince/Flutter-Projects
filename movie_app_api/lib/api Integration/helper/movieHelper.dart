import 'dart:convert';
import 'package:http/http.dart';
import 'package:movie_app_retry/constants/apiConstants.dart';
import '../model/movieModel.dart';

enum movieType { nowPlaying, popular, topRated, Similar, upcoming, videos }

class movieClass {
  Future<List<MovieModel>?> fetchMovie(movieType type, {id}) async {
    var url = '';
    if (type == movieType.nowPlaying) {
      url = movieUrl + Cnow_playing;
    } else if (type == movieType.popular) {
      url = movieUrl + Cpopular;
    } else if (type == movieType.topRated) {
      url = movieUrl + Ctop_rated;
    } else if (type == movieType.Similar) {
      url = movieUrl + id + Csimilar;
    } else if (type == movieType.upcoming) {
      url = movieUrl + Cupcoming;
    } else if (type == movieType.videos) {
      url = movieUrl + Cvideos;
    }
    Response response =
        await get(Uri.parse(url + '?api_key=3c63914fd23ecbed6507f4396ed68164'));
    Map<String, dynamic> jsonBody = jsonDecode(response.body);
    List<dynamic> result = jsonBody['results'];
    List<MovieModel> resultList =
        result.map((e) => MovieModel.fromJson(e)).toList();
    return resultList;
  }

}
