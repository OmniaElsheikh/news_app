import 'package:news_app/data/data_source/articles_data_source/articles_data_source.dart';
import 'package:news_app/data/models/article_model.dart';
import 'package:news_app/repository/articles_repository.dart';

class ArticlesRepositoryImp implements ArticlesRepository {
  ArticlesDataSource articlesDataSource;

  ArticlesRepositoryImp(this.articlesDataSource);

  @override
  Future<List<ArticleModel>> getArticlesList(String sourceId) async {
    return await articlesDataSource.getArticlesList(sourceId);
  }
}
