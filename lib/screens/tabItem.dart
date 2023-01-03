import 'package:flutter/material.dart';
import 'package:news7/models/SourseResponce.dart';

class TabItem extends StatelessWidget {
  bool isSelected;
  Sources sources;

  TabItem(this.sources, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? Colors.green : Colors.transparent,
        border: Border.all(
          color: Colors.green,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        sources.name ?? '',
        style: TextStyle(
            color: isSelected ? Colors.white : Colors.green,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
