import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/core/config/constants.dart';

import '../models/article_model.dart';
import '../models/source_model.dart';

class ApiManager {
  Future<List<SourceModel>> fetchDataSource(String categoryId) async {
    Map<String, dynamic> queryParameters = {
      "apiKey": Constants.apiKey,
      "category": categoryId
    };
    Uri url = Uri.https(
      Constants.baseUrl,
      "/v2/top-headlines/sources",
      queryParameters,
    );
    final response = await http.get(url);

    List<SourceModel>sourceDataList=[];


if (response.statusCode==200){
  var data=jsonDecode(response.body);
  List sourceList=data["sources"];
      for (var element in sourceList) {
        sourceDataList.add(SourceModel.fromJson(element));
      }
      return sourceDataList;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<List<ArticleModel>> fetchDataArticle(String sourceId) async {
    Map<String, dynamic> queryParameters = {
      "apiKey": Constants.apiKey,
      "sources": sourceId,
    };
    Uri url = Uri.https(
      Constants.baseUrl,
      "/v2/everything",
      queryParameters,
    );
    var response = await http.get(url);

    List<ArticleModel>articlesList=[];

if (response.statusCode==200){
  var data=jsonDecode(response.body);
  List articles=data["articles"];
  for(var element in articles){
    articlesList.add(ArticleModel.fromJson(element));
  }
  return articlesList;
}else {
  // If the server did not return a 200 OK response,
  // then throw an exception.
  throw Exception('Failed to load album');
}
  }
}