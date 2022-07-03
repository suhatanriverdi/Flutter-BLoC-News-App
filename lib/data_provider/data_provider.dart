import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/api_constants.dart';
import '../model/article_model.dart';

class DataProvider {
  // Sample
  // https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey
  // https://newsapi.org/v2/top-headlines?category=science&country=us&apiKey=$apiKey
  final endPointUrl = "newsapi.org";
  final unencodedPath = "/v2/top-headlines";
  final client = http.Client();

  Future<List<Article>> getArticles(String categoryName, String country) async {
    Map<String, String> queryParameters = {'country': country};

    // If not topheadlines
    if (categoryName[1] != 'o') {
      queryParameters['category'] = categoryName;
    }

    queryParameters['apiKey'] = ApiConstants.apiKey;

    try {
      final uri = Uri.https(endPointUrl, unencodedPath, queryParameters);
      final response = await client.get(uri);

      Map<String, dynamic> json = jsonDecode(response.body);

      List<dynamic> body = json['articles'];

      List<Article> articles = [];

      articles = body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } catch (e) {
      throw ("Can't get the Articles!");
    }
  }
}
