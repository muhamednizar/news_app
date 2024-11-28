import 'package:flutter/material.dart';
import 'package:news_app/core/assets_manager.dart';
import 'package:news_app/core/colors_manager.dart';
import 'package:news_app/data_model/category_DM.dart';
import 'package:news_app/presentetion/screens/home/home_drawer/home_drawer.dart';
import 'package:news_app/presentetion/screens/home/tabs/categories/categories.dart';
import 'package:news_app/presentetion/screens/home/tabs/category_details/category_details.dart';
import 'package:news_app/presentetion/screens/home/tabs/details_screen/details_screen.dart';
import 'package:news_app/presentetion/screens/home/tabs/settings/settings.dart';

import '../../../data/api/api_manager/api_manager.dart';
import '../../../data/api/model/articles_response/ArticlesResponse.dart';
import '../../../data/api/model/articles_response/atricle.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Widget selectedWidget;
  String appBarTitle = 'News App';
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();
  List<Article> searchResults = [];

  @override
  void initState() {
    super.initState();
    selectedWidget = Categories(onCategoryClicked: onCategoryClicked);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorsManager.white,
        image: DecorationImage(image: AssetImage(AssetsManager.splashPattern)),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: isSearching
              ? TextField(
                  controller: searchController,
                  decoration: const InputDecoration(
                    hintText: 'Search Article',
                    border: InputBorder.none,
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  style: const TextStyle(color: Colors.black),
                  onChanged: (query) {
                    if (query.isNotEmpty) {
                      searchNews(query);
                    } else {
                      setState(() {
                        searchResults = [];
                      });
                    }
                  },
                )
              : Text(appBarTitle),
          actions: [
            IconButton(
              icon: Icon(isSearching ? Icons.cancel : Icons.search),
              onPressed: () {
                setState(() {
                  if (isSearching) {
                    isSearching = false;
                    searchController.clear();
                    searchResults = [];
                  } else {
                    isSearching = true;
                  }
                });
              },
            ),
          ],
        ),
        drawer: HomeDrawer(onDrawerItemClicked: onDrawerItemClicked),
        body: isSearching
            ? searchResults.isEmpty
                ? const Center(child: Text('No articles found.'))
                : ListView.builder(
                    itemCount: searchResults.length,
                    itemBuilder: (context, index) {
                      var article = searchResults[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(10),
                          title: Text(
                            article.title ?? 'No title',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                article.description ?? 'No description',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Published: ${article.publishedAt ?? 'Unknown'}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ArticleDetailsScreen(
                                  article: article,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  )
            : selectedWidget,
      ),
    );
  }

  void onCategoryClicked(CategoryDM categoryDM) {
    selectedWidget = CategoryDetails(categoryDM: categoryDM);
    appBarTitle = categoryDM.title;
    setState(() {});
  }

  void onDrawerItemClicked(MenuItem item) {
    Navigator.pop(context);
    if (item == MenuItem.categories) {
      selectedWidget = Categories(onCategoryClicked: onCategoryClicked);
      appBarTitle = 'Categories';
    } else if (item == MenuItem.settings) {
      selectedWidget = Settings();
      appBarTitle = 'Settings';
    }
    setState(() {});
  }

  Future<void> searchNews(String query) async {
    ArticlesResponse response = await ApiManager.searchArticles(query);

    setState(() {
      searchResults = response.articles ?? [];
    });
  }
}
