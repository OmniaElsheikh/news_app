import 'package:news_app/data/models/article_model.dart';

abstract class ArticlesRepository {
  Future<List<ArticleModel>> getArticlesList(String sourceId);
}
