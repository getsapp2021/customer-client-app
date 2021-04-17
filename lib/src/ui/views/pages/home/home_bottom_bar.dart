import 'package:customer/src/ui/utils/colors.dart';
import 'package:customer/src/ui/views/pages/home/store_home_page.dart';
import 'package:customer/src/ui/views/pages/home/stores_by_category_page.dart';
import 'package:customer/src/ui/views/pages/home/stores_categories_page.dart';
import 'package:customer/src/ui/views/widgets/g_icon_icons.dart';
import 'package:flutter/material.dart';
import 'package:customer/src/ui/views/widgets/g_icon_icons.dart';
import 'package:flutter_svg/svg.dart';

class HomeBottomBar extends StatefulWidget {
  @override
  _HomeBottomBarState createState() => _HomeBottomBarState();
}

class _HomeBottomBarState extends State<HomeBottomBar> {
  Color iconColor = ThemeColors.body;

  List<String> iconName = [
    "assets/images/bottomnavigation/stores.svg",
    "assets/images/bottomnavigation/services.svg",
    "assets/images/bottomnavigation/activity.svg",
    "assets/images/bottomnavigation/chat.svg",
    "assets/images/bottomnavigation/person.svg"
  ];
  List<String> iconOption = [
    "Stores",
    "Services",
    "Activity",
    "Chat",
    "Account"
  ];

  List navOptions = [
    StoreHomePage(),
    StoreCategoriesPage(),
    StoresByCategoryPage(),
  ];

  String selectedIconOption = "Store";


  @override
  Widget build(BuildContext context) {


    return BottomAppBar(
      child: Container(
        height: 70,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: iconOption.length,
          itemBuilder: (BuildContext context, int index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {

                      setState(() {
                        selectedIconOption = iconOption[index];
                      });
                      Navigator
                          .of(context)
                          .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) => navOptions[index]));
                      // Navigator.pushAndRemoveUntil(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => navOptions[index]),
                      //       (Route<dynamic> route) => false,
                      // );
                    },
                    icon: SvgPicture.asset(
                      iconName[index],
                      height: 20,
                      color: selectedIconOption ==  iconOption[index] ? ThemeColors.primary : iconColor,
                    ),
                  ),
                  Text(
                    iconOption[index],
                    style: TextStyle(
                      color: selectedIconOption ==  iconOption[index] ? ThemeColors.primary : iconColor,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    // return BottomAppBar(
    //   shape: CircularNotchedRectangle(),
    //   color: Colors.white,
    //   child: Container(
    //     padding: EdgeInsets.symmetric(horizontal: 20),
    //     height: 70,
    //     child: Row(
    //       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: <Widget>[
    //         Container(
    //           child: Column(
    //             children: [
    //               IconButton(
    //                 onPressed: () {
    //                   setState(() {
    //                     iconColor= ThemeColors.primary;
    //                   });
    //                 },
    //                 icon: SvgPicture.asset(
    //                   "assets/images/bottomnavigation/stores.svg",
    //                   height: 20,
    //                   color: iconColor,
    //                 ),
    //
    //               ),
    //               Text(
    //                 "Stores",
    //                 style: bottomtextstyle,
    //               ),
    //             ],
    //           ),
    //         ),
    //         Container(
    //           child: Column(
    //             children: [
    //               IconButton(
    //                 onPressed: () {
    //                   setState(() {
    //                     iconColor= ThemeColors.primary;
    //                   });
    //                 },
    //                 icon: SvgPicture.asset(
    //                   "assets/images/bottomnavigation/services.svg",
    //                   height: 20,
    //                   color: iconColor,
    //                 ),
    //               ),
    //               Text("Services", style: bottomtextstyle),
    //             ],
    //           ),
    //         ),
    //         Container(
    //           child: Column(
    //             children: [
    //               IconButton(
    //                 onPressed: () {
    //                   setState(() {
    //                     iconColor= ThemeColors.primary;
    //                   });
    //                 },
    //                 icon: SvgPicture.asset(
    //                   "assets/images/bottomnavigation/activity.svg",
    //                   height: 20,
    //                   color: iconColor,
    //                 ),
    //               ),
    //               Text("Activity", style: bottomtextstyle),
    //             ],
    //           ),
    //         ),
    //         Container(
    //           child: Column(
    //             children: [
    //               IconButton(
    //                 onPressed: () {
    //                   setState(() {
    //                     iconColor= ThemeColors.primary;
    //                   });
    //                 },
    //
    //                 icon: SvgPicture.asset(
    //                   "assets/images/bottomnavigation/chat.svg",
    //                   height: 20,
    //                   color: iconColor,
    //                 ),
    //               ),
    //               Text("Chat", style: bottomtextstyle),
    //             ],
    //           ),
    //         ),
    //         Container(
    //           child: Column(
    //             children: [
    //               IconButton(
    //                 onPressed: () {
    //                   setState(() {
    //                     iconColor= ThemeColors.primary;
    //                   });
    //                 },
    //                 icon: SvgPicture.asset(
    //                   "assets/images/bottomnavigation/person.svg",
    //                   height: 20,
    //                   color: iconColor,
    //                 ),
    //               ),
    //               Text("Account", style: bottomtextstyle),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}

//   Widget getViewForIndex(int index) {
//     if (!_viewCache.containsKey(index)) {
//       switch (index) {
//         case 0:
//           _viewCache[index] = null;
//           break;
//         case 1:
//           _viewCache[index] = null;
//           break;
//         case 2:
//           _viewCache[index] = null;
//           break;
//       }
//     }
//
//     return _viewCache[index];
//   }
// }
