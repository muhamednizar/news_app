import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_styles.dart';
import 'package:news_app/core/colors_manager.dart';

class HomeDrawer extends StatelessWidget {
  HomeDrawer({super.key, required this.onDrawerItemClicked});

  Function(MenuItem) onDrawerItemClicked;
  static const categories = 1;
  static const settings = 2;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 110.h,
            color: ColorsManager.green,
            child: Center(
                child: Text(
              AppLocalizations.of(context)!.titleDrawer,
              style: AppStyles.drawerTitle,
            )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    onDrawerItemClicked(MenuItem.categories);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.format_list_bulleted,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        AppLocalizations.of(context)!.categoriesDrawer,
                        style: AppStyles.drawerItems,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                InkWell(
                  onTap: () {
                    onDrawerItemClicked(MenuItem.settings);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.settings,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        AppLocalizations.of(context)!.settingsDrawer,
                        style: AppStyles.drawerItems,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

enum MenuItem {
  categories,
  settings,
}
