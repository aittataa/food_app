// import 'package:flutter/material.dart';
// import 'package:food_app/app/config/themes/app_theme.dart';
// import 'package:food_app/app/data/models/meals.dart';
// import 'package:food_app/app/modules/home/controllers/home_controller.dart';
//
// class HomeBody extends StatelessWidget {
//   final HomeController controller;
//   final List<Meal> titles;
//   const HomeBody({
//     Key? key,
//     required this.controller,
//     required this.titles,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           height: 50,
//           child: ListView.builder(
//             shrinkWrap: true,
//             scrollDirection: Axis.horizontal,
//             physics: BouncingScrollPhysics(),
//             padding: EdgeInsets.symmetric(horizontal: 5),
//             itemCount: titles.length,
//             itemBuilder: (context, i) {
//               final Meal meal = titles[i];
//               return TitleShape(label: meal.strArea!, onTap: () {});
//             },
//           ),
//         ),
//         Expanded(child: Center(child: Text("Hello World"))),
//       ],
//     );
//   }
// }
//
// class TitleShape extends StatelessWidget {
//   final String label;
//   final Function()? onTap;
//   const TitleShape({Key? key, required this.label, this.onTap}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         margin: EdgeInsets.all(5),
//         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//           color: AppTheme.mainColor,
//           borderRadius: BorderRadius.circular(25),
//         ),
//         child: Text(
//           label,
//           textAlign: TextAlign.center,
//           overflow: TextOverflow.ellipsis,
//           style: TextStyle(
//             color: AppTheme.primaryTextColor,
//             fontWeight: FontWeight.w900,
//             letterSpacing: 1,
//           ),
//         ),
//       ),
//     );
//   }
// }
