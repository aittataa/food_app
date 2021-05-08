import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constant/constant.dart';
import 'package:food_app/screens/products_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesScreen extends StatelessWidget {
  static const String id = "CategoriesScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Column(
            children: [
              SizedBox(
                child: ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  leading: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [Constant.boxShadow],
                      ),
                      child: Icon(
                        Icons.chevron_left,
                        color: Colors.black,
                        size: 27,
                      ),
                    ),
                  ),
                  title: Text(
                    "Categories",
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
                      CupertinoIcons.heart,
                      color: Colors.white,
                      size: 27,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.all(10),
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  itemCount: Constant.itemCount,
                  itemBuilder: (context, index) {
                    bool state = index % 2 == 0;
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, ProductsScreen.id);
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [Constant.boxShadow],
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Center(
                                child: Image.asset(
                                  state ? "images/pizza.png" : "images/hamburger.png",
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  state ? "Pizza" : "Burger",
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
