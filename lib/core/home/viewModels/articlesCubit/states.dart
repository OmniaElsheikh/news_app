import '../../../../data/models/article_model.dart';

sealed class ArticlesStates {}

class LoadingArticlesStates extends ArticlesStates {}

class SuccessArticlesStates extends ArticlesStates {
  List<ArticleModel> articlesList;

  SuccessArticlesStates(this.articlesList);
}

class ErrorArticlesStates extends ArticlesStates {
  String? errorMessage;

  ErrorArticlesStates({this.errorMessage});
}
