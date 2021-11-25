import 'package:flutter/material.dart';
import 'package:food_app/app/modules/categories/views/categories_view.dart';
import 'package:food_app/app/modules/home/views/home_view.dart';
import 'package:food_app/app/modules/initial/widgets/navigation_bar.dart';
import 'package:food_app/app/modules/search/views/search_view.dart';

class InitialView extends StatefulWidget {
  @override
  State<InitialView> createState() => _InitialViewState();
}

class _InitialViewState extends State<InitialView> {
  late PageController pageController = PageController();
  late int pageIndex;

  @override
  void initState() {
    super.initState();
    pageIndex = 2;
    pageController = PageController(initialPage: pageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          HomeView(),
          SearchView(),
          CategoriesView(),
          Container(color: Colors.red),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        currentIndex: pageIndex,
        onTap: (index) {
          setState(() {
            pageIndex = index;
            pageController.jumpToPage(pageIndex);
          });
        },
      ),
    );
  }
}
