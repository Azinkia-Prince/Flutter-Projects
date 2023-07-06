import 'dart:convert';
import 'package:ethocity_v4/Model/news_model.dart';
import 'package:http/http.dart';

Future<List<NewsModel>?> fetchNews() async {
  final apiLink = Uri.parse("https://newsapi.org/v2/everything?q=বাংলাদেশ&sortBy=publishedAt&apiKey=26c1a8ebeaae48cdaada1eeb535a4f23");
  Response response = await get(apiLink);
  Map<String,dynamic> newsBody = jsonDecode(response.body);
  List<dynamic> Article = newsBody['articles'];
  List<NewsModel>newsList = Article.map((e) => NewsModel.fromJson(e)).toList();
  return newsList;
}