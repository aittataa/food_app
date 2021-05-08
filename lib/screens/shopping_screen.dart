import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_app/constant/constant.dart';
import 'package:food_app/screens/product_details.dart';
import 'package:google_fonts/google_fonts.dart';

class ShoppingScreen extends StatelessWidget {
  static const String id = "ShoppingScreen";

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
                    "Cart",
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
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.all(10),
                  scrollDirection: Axis.vertical,
                  itemCount: Constant.itemCount ~/ 5,
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
                        height: 75,
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [Constant.boxShadow],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Image.asset(
                                state ? "images/pizza.png" : "images/hamburger.png",
                                height: 50,
                                width: 50,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Container(
                                  //   alignment: Alignment.centerRight,
                                  //   child: Icon(
                                  //     state ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                                  //     color: state ? Colors.red : Colors.black54,
                                  //   ),
                                  // ),
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
                                    trailing: Container(
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
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                child: ListTile(
                  dense: true,
                  title: Text(
                    "Amount Total : ",
                    style: GoogleFonts.itim(
                      color: Colors.black54,
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                    ),
                  ),
                  trailing: Text(
                    "259 DH",
                    style: GoogleFonts.itim(
                      color: Colors.black54,
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
