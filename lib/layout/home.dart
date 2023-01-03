import 'package:flutter/material.dart';

import 'package:news7/models/categoryData.dart';
import 'package:news7/screens/homeScreen.dart';

import '../screens/category.dart';
import '../screens/drawer_screen.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = 'homeScreen';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage(
              'assets/imges/pattern.png',
            ),
            fit: BoxFit.cover,
          )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.green,
          shape: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              )),
          title: Text(
            'News',
            style: TextStyle(),
          ),
        ),
        drawer: Drawer_Screen(onDrawerSelected),
        body: categoryData == null
            ? CategoryScreen(onCategorySelected)
            : HomesScreen(categoryData!),
      ),
    );
  }

  CategoryData? categoryData = null;

  void onCategorySelected(categorySelected) {
    categoryData = categorySelected;
    setState(() {});
  }

  void onDrawerSelected(num) {
    if (num == Drawer_Screen.CATEGORYS) {
      categoryData = null;
      Navigator.pop(context);
    } else if (num == Drawer_Screen.SETTINGS) {}
    setState(() {});
  }
}
