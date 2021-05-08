import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_app/constant/constant.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetails extends StatelessWidget {
  static const String id = "ProductDetails";
  final bool state;
  const ProductDetails({this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 10),
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
                    "Products",
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
                      state ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                      color: state ? Colors.red : Colors.white,
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
                      height: 350,
                      child: Center(
                        child: Image.asset(
                          state ? "images/pizza.png" : "images/hamburger.png",
                          height: 200,
                          width: 200,
                        ),
                      ),
                    ),
                    SizedBox(
                      child: ListTile(
                        title: Text(
                          state ? "Pizza" : "Burger",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 25,
                          ),
                        ),
                        subtitle: Row(
                          children: [
                            Text(
                              state ? "50 min.   " : "30 min.   ",
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.star,
                              color: mainColor,
                            ),
                            Text(
                              state ? " 5.0" : " 4.3",
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        trailing: Text(
                          state ? "25 DH" : "49 DH",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Text(
                            "Ingredients",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        subtitle: SizedBox(
                          height: 75,
                          child: GridView.builder(
                            reverse: true,
                            physics: BouncingScrollPhysics(),
                            padding: EdgeInsets.all(5),
                            scrollDirection: Axis.horizontal,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              mainAxisSpacing: 5,
                            ),
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              bool state = index % 3 == 0;
                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [Constant.boxShadow],
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Center(
                                        child: Image.asset(
                                          state ? "images/pizza.png" : "images/hamburger.png",
                                          height: 32,
                                          width: 32,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          state ? "Pizza" : "Burger",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: ListTile(
                        title: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Text(
                            "Details",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        subtitle: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 64,
                margin: EdgeInsets.only(left: 25, right: 25, top: 5),
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 10,
                      child: Text(
                        "Add To Cart",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Expanded(child: SizedBox(width: 1)),
                    Expanded(
                      flex: 8,
                      child: Align(
                        alignment: Alignment.centerLeft,
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
            ],
          ),
        ),
      ),
    );
  }
}
