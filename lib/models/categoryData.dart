import 'package:flutter/material.dart';

class CategoryData {
  String id;
  String title;
  String image;
  Color color;

  CategoryData(this.id, this.title, this.image, this.color);

  static List<CategoryData> getCategoryData() {
    return [
      CategoryData(
          'sports', 'sports', 'assets/imges/sports.png', Color(0xFFC91C22)),
      CategoryData('business', 'Business', 'assets/imges/bussines.png',
          Color(0xFFCF7E48)),
      CategoryData('entertainment', 'Entertainment',
          'assets/imges/environment.png', Color(0xFF003E90)),
      CategoryData(
          'health', 'Health', 'assets/imges/health.png', Color(0xFFED1E79)),
      CategoryData(
          'science', 'Science', 'assets/imges/science.png', Color(0xFFF2D352)),
      CategoryData('technology', 'Technology', 'assets/imges/technology.png',
          Color(0xFFC95689)),
      CategoryData(
          'general', 'General', 'assets/imges/sports.png', Color(0xFF4882CF)),
    ];
  }
}
