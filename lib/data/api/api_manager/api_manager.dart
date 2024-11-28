import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/data/api/model/articles_response/ArticlesResponse.dart';
import 'package:news_app/data/api/model/sources_response/sources_response.dart';

//https://newsapi.org/v2/top-headlines/sources?apiKey=be69a84c535c43928fdad67c7cd21548
class ApiManager {
  static const String _baseUrl = 'newsapi.org';
  static const String _apiKey = 'c1f6924cfe19436db4b460a2f7ca2431';
  static const String sourcesEndPoint = '/v2/top-headlines/sources';
  static const String articlesEndPoint = '/v2/everything';

  static Future<ArticlesResponse> searchArticles(String query) async {
    Uri url = Uri.https(_baseUrl, articlesEndPoint, {
      'apiKey': _apiKey,
      'q': query,
    });

    http.Response serverResponse = await http.get(url);
    Map<String, dynamic> json = jsonDecode(serverResponse.body);

    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
    return articlesResponse;
  }

  static Future<SourcesResponse> getSources(String categoryId) async {
    Uri url = Uri.https(_baseUrl, sourcesEndPoint, {
      'apiKey': _apiKey,
      'category': categoryId,
    });
    http.Response serverResponse = await http.get(url);
    Map<String, dynamic> json = jsonDecode(serverResponse.body);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
    return sourcesResponse;
  }

  static Future<ArticlesResponse> getArticles(String sourceId) async {
    Uri url = Uri.https(_baseUrl, articlesEndPoint, {
      'apiKey': _apiKey,
      'sources': sourceId,
    });
    http.Response serverResponse = await http.get(url);
    Map<String, dynamic> json = jsonDecode(serverResponse.body);
    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
    return articlesResponse;
  }
}
