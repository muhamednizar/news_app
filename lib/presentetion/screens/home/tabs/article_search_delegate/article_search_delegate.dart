import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ArticleSearchDelegate extends SearchDelegate {
  // استخدام متغير لتخزين المقالات التي تأتي من API
  List<String> articles = [];

  // منطق البحث باستخدام API
  Future<void> fetchArticles(String query) async {
    final response = await http
        .get(Uri.parse('https://api.example.com/search?query=$query'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      // تحويل البيانات المسترجعة إلى قائمة من المقالات (تأكد من هيكل البيانات من الـ API)
      articles = List<String>.from(
          data['articles'].map((article) => article['title']));
    } else {
      throw Exception('Failed to load articles');
    }
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // إجراء البحث باستخدام الـ query
    return FutureBuilder<void>(
      future: fetchArticles(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final results = articles
            .where((article) =>
                article.toLowerCase().contains(query.toLowerCase()))
            .toList();

        return ListView.builder(
          itemCount: results.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(results[index]),
              onTap: () {
                close(context, results[index]);
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<void>(
      future: fetchArticles(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final suggestions = articles
            .where((article) =>
                article.toLowerCase().startsWith(query.toLowerCase()))
            .toList();

        return ListView.builder(
          itemCount: suggestions.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(suggestions[index]),
              onTap: () {
                query = suggestions[index];
                showResults(context);
              },
            );
          },
        );
      },
    );
  }
}
