import 'package:news_app/data/models/article_model.dart';

abstract class ArticlesDataSource {
  Future<List<ArticleModel>> getArticlesList(String sourceId);
}
