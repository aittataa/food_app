import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_app/constant/constant.dart';
import 'package:food_app/models/categories.dart';
import 'package:food_app/models/ingredients.dart';
import 'package:food_app/models/meals.dart';
import 'package:food_app/screens/shopping_screen.dart';
import 'package:food_app/services/api_controller.dart';
import 'package:food_app/widgets/bounce_point.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "HomeScreen";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiController controller = Get.put(ApiController());
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () async {},
          icon: Icon(
            CupertinoIcons.text_alignleft,
            color: Colors.black,
            size: 27,
          ),
        ),
        centerTitle: true,
        title: Text(
          "TALABATAK",
          style: GoogleFonts.itim(
            color: Colors.black54,
            fontWeight: FontWeight.w900,
            fontSize: 20,
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: mainColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [Constant.boxShadow],
            ),
            child: IconButton(
              onPressed: () => Get.to(() => ShoppingScreen()),
              icon: Icon(
                CupertinoIcons.cart_fill,
                color: Colors.white,
                size: 27,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Expanded(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(
                child: ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
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
              Obx(() {
                final Meals myList = controller.categoriesTitleList.value;
                final bool isNotEmpty = myList.meals.isNotEmpty;
                if (isNotEmpty) {
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    subtitle: SizedBox(
                      height: 50,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.all(5),
                        scrollDirection: Axis.horizontal,
                        itemCount: Constant.itemCount,
                        itemBuilder: (context, index) {
                          String strCategory = myList.meals[index].strCategory;
                          return AnimatedContainer(
                            duration: Constant.duration,
                            curve: Constant.curve,
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: [Constant.boxShadow],
                            ),
                            child: Center(
                              child: Text(
                                "$strCategory",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                } else {
                  return BouncePoint(size: 32);
                }
              }),
              Obx(() {
                final Meals myList = controller.areaTitleList.value;
                final bool isNotEmpty = myList.meals.isNotEmpty;
                if (isNotEmpty) {
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    subtitle: SizedBox(
                      height: 50,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.all(5),
                        scrollDirection: Axis.horizontal,
                        itemCount: Constant.itemCount,
                        itemBuilder: (context, index) {
                          String strArea = myList.meals[index].strArea;
                          return AnimatedContainer(
                            duration: Constant.duration,
                            curve: Constant.curve,
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: [Constant.boxShadow],
                            ),
                            child: Center(
                              child: Text(
                                "$strArea",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                } else {
                  return BouncePoint(size: 32);
                }
              }),
              Obx(() {
                final Ingredients myList = controller.ingredientList.value;
                final bool isNotEmpty = myList.ingredients.isNotEmpty;
                if (isNotEmpty) {
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    subtitle: SizedBox(
                      height: 50,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.all(5),
                        scrollDirection: Axis.horizontal,
                        itemCount: Constant.itemCount,
                        itemBuilder: (context, index) {
                          Ingredient ingredient = myList.ingredients[index];
                          return AnimatedContainer(
                            duration: Constant.duration,
                            curve: Constant.curve,
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: [Constant.boxShadow],
                            ),
                            child: Center(
                              child: Text(
                                "${ingredient.strIngredient}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                } else {
                  return BouncePoint(size: 32);
                }
              }),
              Obx(() {
                final Categories myList = controller.categoriesList.value;
                final bool isNotEmpty = myList.categories.isNotEmpty;
                if (isNotEmpty) {
                  return ListTile(
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
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: mainColor,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.chevron_right,
                              color: Colors.black,
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
                          Category category = myList.categories[index];
                          return AnimatedContainer(
                            duration: Constant.duration,
                            curve: Constant.curve,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [Constant.boxShadow],
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Image.network(
                                    "${category.strCategoryThumb}",
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      "${category.strCategory}",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w900,
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
                  );
                } else {
                  return BouncePoint(size: 32);
                }
              }),

              /*
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
                            // Navigator.pushNamed(context, ProductsScreen.id);
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
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => ProductDetails(state: state),
                            //   ),
                            // );
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
                                      state ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
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
              */
              /*
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
                            // Navigator.pushNamed(context, ProductsScreen.id);
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
                    child: PageView.builder(
                      //controller: PageController(viewportFraction: 0.95),
                      physics: BouncingScrollPhysics(),
                      itemCount: Constant.itemCount,
                      itemBuilder: (context, index) {
                        bool state = index % 3 == 0;
                        return GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => ProductDetails(state: state),
                            //   ),
                            // );
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
                                            state ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
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
              */
            ],
          ),
        ),
      ),
    );
  }
}
