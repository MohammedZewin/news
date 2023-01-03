import 'package:flutter/material.dart';
import 'package:news7/models/categoryData.dart';

import 'catagoryItem.dart';

class CategoryScreen extends StatelessWidget {
  Function onCategorySelect;

  CategoryScreen(this.onCategorySelect);

  @override
  Widget build(BuildContext context) {
    var categorys = CategoryData.getCategoryData();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 7),
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: GridView.builder(
              itemCount: categorys.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      onCategorySelect(categorys[index]);
                    },
                    child: CatagoryItem(categorys[index], index));
              },
            ),
          ),
        ],
      ),
    );
  }
}
