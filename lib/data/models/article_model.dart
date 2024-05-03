import 'package:news_app/data/models/source_model.dart';

class ArticleModel{
  final SourceModel source;
  final String title;
  final String auther;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;
  ArticleModel({
      required this.source,
    required this.title,
    required this.auther,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });
  factory ArticleModel.fromJson(Map<String,dynamic>json)=>
      ArticleModel(
        source: SourceModel.fromJson(json["source"]),
        auther: json["auther"]??"",
        title: json["title"]??"",
        description: json["description"]??"",
        url: json["url"]??"",
        urlToImage: json["urlToImage"]??"",
        publishedAt: json["publishedAt"]??"",
        content: json["content"]??"",
      );
}