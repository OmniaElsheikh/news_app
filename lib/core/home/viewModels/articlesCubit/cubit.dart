import 'package:bloc/bloc.dart';
import 'package:news_app/core/home/viewModels/articlesCubit/states.dart';
import 'package:news_app/data/data_source/articles_data_source/articles_data_source.dart';
import 'package:news_app/data/data_source/articles_data_source/online_articles_imp.dart';
import 'package:news_app/data/repository_imp/articles_repository_imp.dart';
import 'package:news_app/repository/articles_repository.dart';

import '../../../../data/network/api_manager.dart';

class ArticlesCubit extends Cubit<ArticlesStates> {
  ArticlesCubit() : super(LoadingArticlesStates());
  late ApiManager apiManager;
  late ArticlesDataSource articlesDataSource;
  late ArticlesRepository articlesRepository;

  getNewsArticles(String sourceId) async {
    articlesRepository = ArticlesRepositoryImp(articlesDataSource);
    articlesDataSource = OnlineArticlesImp(apiManager);
    emit(LoadingArticlesStates());
    try {
      var articlesList = await articlesRepository.getArticlesList(sourceId);
      emit(SuccessArticlesStates(articlesList));
    } catch (error) {
      emit(ErrorArticlesStates(errorMessage: error.toString()));
    }
  }
}
