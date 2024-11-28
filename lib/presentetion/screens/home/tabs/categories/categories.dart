import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_styles.dart';
import 'package:news_app/data_model/category_DM.dart';

import 'category_widget/category_widget.dart';

typedef OnCategoryClicked = void Function(CategoryDM);

class Categories extends StatelessWidget {
  Categories({super.key, required this.onCategoryClicked});

  OnCategoryClicked onCategoryClicked;
  List<CategoryDM> categoriesList = CategoryDM.getAllCategories();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: REdgeInsets.all(8.0),
                child: Text(
                  AppLocalizations.of(context)!.categorySelect,
                  style: AppStyles.categoryTitle,
                ),
              ),
            ],
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 25, crossAxisSpacing: 20),
              itemCount: categoriesList.length,
              itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    onCategoryClicked(categoriesList[index]);
                  },
                  child: CategoryWidget(
                      categoryDM: categoriesList[index], index: index)),
            ),
          )
        ],
      ),
    );
  }
}
