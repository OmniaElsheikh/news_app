import '../../models/article_model.dart';
import '../../network/api_manager.dart';
import 'articles_data_source.dart';

class OnlineArticlesImp implements ArticlesDataSource {
  ApiManager apiManager;

  OnlineArticlesImp(this.apiManager);

  @override
  Future<List<ArticleModel>> getArticlesList(String sourceId) async {
    return await apiManager.fetchDataArticle(sourceId);
  }
}
