import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/api/model/articles_response/atricle.dart';

class ArticlesViewModel extends ChangeNotifier {
  List<Article>? articles;
  String? errorMessage;
  bool isLoading = false;

  void getNewsBySourceId(String sourceId) async {
    try {
      isLoading = true;
      notifyListeners();
      var response = await ApiManager.getArticles(sourceId); // 1hour
      isLoading = false;
      if (response.status == 'ok') {
        articles = response.articles;
      } else {
        errorMessage = response.message;
      }
      notifyListeners();
    } catch (e) {
      isLoading = false;
      errorMessage = 'Plz, Check internet connection';
      notifyListeners();
    }
  }
}
