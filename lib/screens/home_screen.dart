import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_app/constant/constant.dart';
import 'package:food_app/screens/categories_screen.dart';
import 'package:food_app/screens/product_details.dart';
import 'package:food_app/screens/products_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "HomeScreen";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 15),
          child: Column(
            children: [
              SizedBox(
                child: ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  leading: Icon(
                    CupertinoIcons.text_alignleft,
                    color: Colors.black,
                    size: 27,
                  ),
                  title: Text(
                    "TALABATAK",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.itim(
                      color: Colors.black54,
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                    ),
                  ),
                  trailing: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [Constant.boxShadow],
                    ),
                    child: Icon(
                      CupertinoIcons.bell,
                      color: Colors.white,
                      size: 27,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    SizedBox(
                      child: ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        title: Text(
                          "Delicious",
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w900,
                            fontSize: 15,
                          ),
                        ),
                        subtitle: Text(
                          "Food Menu",
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [Constant.boxShadow],
                        ),
                        child: TextField(
                          scrollPadding: EdgeInsets.zero,
                          style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w900),
                          cursorColor: Colors.black54,
                          decoration: InputDecoration(
                            icon: Icon(Icons.search, color: Colors.black54),
                            border: InputBorder.none,
                            hintText: "Search...",
                            hintStyle: TextStyle(
                              color: Colors.black38,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        title: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Categories",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, CategoriesScreen.id);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: mainColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.chevron_right,
                                    color: Colors.black,
                                    size: 27,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        subtitle: SizedBox(
                          height: 200,
                          child: GridView.builder(
                            physics: BouncingScrollPhysics(),
                            padding: EdgeInsets.all(10),
                            scrollDirection: Axis.horizontal,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              mainAxisSpacing: 10,
                              childAspectRatio: 1.25,
                            ),
                            itemCount: Constant.itemCount,
                            itemBuilder: (context, index) {
                              bool state = currentIndex == index;
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentIndex = index;
                                    state = currentIndex == index;
                                    Navigator.pushNamed(context, ProductsScreen.id);
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: state ? mainColor : Colors.white,
                                    borderRadius: BorderRadius.circular(25),
                                    boxShadow: [Constant.boxShadow],
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Image.asset(
                                          index % 2 == 0
                                              ? "images/pizza.png"
                                              : "images/hamburger.png",
                                          width: 64,
                                          height: 64,
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            index % 2 == 0 ? "Pizza" : "Burger",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        title: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Popular",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, ProductsScreen.id);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: mainColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.chevron_right,
                                    color: Colors.black,
                                    size: 27,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        subtitle: SizedBox(
                          height: 300,
                          child: GridView.builder(
                            physics: BouncingScrollPhysics(),
                            padding: EdgeInsets.all(10),
                            scrollDirection: Axis.horizontal,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              mainAxisSpacing: 10,
                              childAspectRatio: 1.5,
                            ),
                            itemCount: Constant.itemCount,
                            itemBuilder: (context, index) {
                              bool state = index % 3 == 0;
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductDetails(state: state),
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(25),
                                    boxShadow: [Constant.boxShadow],
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.centerRight,
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            state
                                                ? CupertinoIcons.heart_fill
                                                : CupertinoIcons.heart,
                                            color: state ? Colors.red : Colors.black54,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Image.asset(
                                          state ? "images/pizza.png" : "images/hamburger.png",
                                          height: 100,
                                          width: 100,
                                        ),
                                      ),
                                      ListTile(
                                        contentPadding: EdgeInsets.zero,
                                        minVerticalPadding: 0,
                                        minLeadingWidth: 0,
                                        horizontalTitleGap: 0,
                                        title: Text(
                                          state ? "Pizza" : "Burger",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        subtitle: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              state ? "50 min.   " : "30 min.   ",
                                              style: TextStyle(
                                                color: Colors.black54,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12.5,
                                              ),
                                            ),
                                            Icon(
                                              Icons.star,
                                              size: 15,
                                              color: mainColor,
                                            ),
                                            Text(
                                              state ? " 5.0" : " 4.3",
                                              style: TextStyle(
                                                color: Colors.black54,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12.5,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  color: mainColor,
                                                  borderRadius: BorderRadius.only(
                                                    topRight: Radius.circular(25),
                                                    bottomLeft: Radius.circular(25),
                                                  ),
                                                ),
                                                child: Icon(
                                                  Icons.add,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                padding: EdgeInsets.all(10),
                                                child: Text(
                                                  state ? "25 DH" : "49 DH",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        title: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Hot New",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, ProductsScreen.id);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: mainColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.chevron_right,
                                    color: Colors.black,
                                    size: 27,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        subtitle: Container(
                          height: 200,
                          child: PageView.builder(
                            controller: PageController(viewportFraction: 0.95),
                            physics: BouncingScrollPhysics(),
                            itemCount: Constant.itemCount,
                            itemBuilder: (context, index) {
                              bool state = index % 3 == 0;
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductDetails(state: state),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(25),
                                    boxShadow: [Constant.boxShadow],
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Image.asset(
                                          state ? "images/pizza.png" : "images/hamburger.png",
                                          height: 100,
                                          width: 100,
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              alignment: Alignment.centerRight,
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  state
                                                      ? CupertinoIcons.heart_fill
                                                      : CupertinoIcons.heart,
                                                  color: state ? Colors.red : Colors.black54,
                                                ),
                                              ),
                                            ),
                                            ListTile(
                                              contentPadding: EdgeInsets.zero,
                                              title: Text(
                                                state ? "Pizza" : "Burger",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                              subtitle: Row(
                                                children: [
                                                  Text(
                                                    state ? "50 min.   " : "30 min.   ",
                                                    style: TextStyle(
                                                      color: Colors.black54,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 12.5,
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    size: 15,
                                                    color: mainColor,
                                                  ),
                                                  Text(
                                                    state ? " 5.0" : " 4.3",
                                                    style: TextStyle(
                                                      color: Colors.black54,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 12.5,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      padding: EdgeInsets.all(10),
                                                      child: Text(
                                                        state ? "25 DH" : "49 DH",
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      padding: EdgeInsets.all(10),
                                                      decoration: BoxDecoration(
                                                        color: mainColor,
                                                        borderRadius: BorderRadius.only(
                                                          topLeft: Radius.circular(25),
                                                          bottomRight: Radius.circular(25),
                                                        ),
                                                      ),
                                                      child: Icon(
                                                        Icons.add,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
