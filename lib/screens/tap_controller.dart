import 'package:flutter/material.dart';
import 'package:news7/models/NewsDataModel.dart';
import 'package:news7/screens/tabItem.dart';
import 'package:news7/shared/network/remote/api_manager.dart';

import '../models/SourseResponce.dart';
import 'newsDataItem.dart';

class Tap_Controller extends StatefulWidget {
  List<Sources> sources;

  Tap_Controller(this.sources);

  @override
  State<Tap_Controller> createState() => _Tap_ControllerState();
}

class _Tap_ControllerState extends State<Tap_Controller> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.sources.length,
            child: TabBar(
              isScrollable: true,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              indicatorColor: Colors.transparent,
              tabs: widget.sources
                  .map(
                    (source) => Tab(
                      child: TabItem(
                          source,
                          widget.sources.indexOf(source) == selectedIndex
                              ? true
                              : false),
                    ),
                  )
                  .toList(),
            )),
        FutureBuilder<NewsDataModel>(
            future:
                ApiManager.getNewsData(widget.sources[selectedIndex].id ?? ''),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Column(
                  children: [
                    Text(snapshot.data?.message ?? 'ERROR !!'),
                    TextButton(
                      child: Text('Try Again'),
                      onPressed: () {},
                    )
                  ],
                );
              }
              ;
              if (snapshot.data?.status != 'ok') {
                return Column(
                  children: [
                    Text(snapshot.data?.message ?? 'ERROR !!'),
                    TextButton(
                      child: Text('Try Again'),
                      onPressed: () {},
                    )
                  ],
                );
              }
              var news = snapshot.data?.articles ?? [];
              return Expanded(
                child: ListView.builder(
                    itemCount: news.length,
                    itemBuilder: (context, index) => NewsCard(
                          news[index],
                        )),
              );
            }),
      ],
    );
  }
}
