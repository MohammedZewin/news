import 'package:flutter/material.dart';
import 'package:news7/models/categoryData.dart';
import 'package:news7/screens/tap_controller.dart';

import '../models/SourseResponce.dart';
import '../shared/network/remote/api_manager.dart';

class HomesScreen extends StatelessWidget {
  CategoryData categoryData;

  HomesScreen(this.categoryData);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponse>(
        future: ApiManager.getSources(categoryData.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(snapshot.data!.message ?? ''),
              )),
            ));
          }
          if (snapshot.data?.status != 'ok') {
            return Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(snapshot.data!.message!),
              )),
            ));
          }
          if (snapshot.hasData) {}
          var sources = snapshot.data?.sources ?? [];
          return Tap_Controller(sources);
        });
  }
}
