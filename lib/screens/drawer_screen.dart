import 'package:flutter/material.dart';

class Drawer_Screen extends StatelessWidget {
  Function onDrawerSelected;

  Drawer_Screen(this.onDrawerSelected);

  static const int CATEGORYS = 1;
  static const int SETTINGS = 1;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 200,
      backgroundColor: Colors.green[900],
      child: Column(
        children: [
          SizedBox(
            height: 200,
          ),
          Text(
            "News",
            style: TextStyle(
                fontWeight: FontWeight.w900, fontSize: 40, color: Colors.white),
          ),
          SizedBox(
            height: 100,
          ),
          InkWell(
            onTap: () {
              onDrawerSelected(CATEGORYS);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                Text(
                  'Categories',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          InkWell(
            onTap: () {
              onDrawerSelected(SETTINGS);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                Text(
                  'Settings',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
