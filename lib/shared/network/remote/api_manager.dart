import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news7/models/SourseResponce.dart';

import '../../../models/NewsDataModel.dart';
import '../../constants/constants.dart';

class ApiManager {
//https://newsapi.org/v2/top-headlines/sources?apiKey=0e0bd24600634ab68ce996527196560a9

  static Future<SourcesResponse> getSources(String category) async {
    var url = Uri.https(
        base, endPointSources, {'apiKey': apikey, 'category': category});
    try {
      Response sources = await http.get(url);
      var json = jsonDecode(sources.body);
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
      return sourcesResponse;
    } catch (e) {
      throw e;
    }
    ;
  }

  static Future<NewsDataModel> getNewsData(String SourceId) async {
    Uri url = Uri.https(
        base, endPointEverything, {'apiKey': apikey, 'sources': SourceId});
    Response response = await http.get(url);
    var json = jsonDecode(response.body);
    NewsDataModel newsDataModel = NewsDataModel.fromJson(json);
    return newsDataModel;
  }
}
