import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/home/viewModels/articlesCubit/cubit.dart';
import 'package:news_app/core/home/viewModels/articlesCubit/states.dart';
import 'package:news_app/core/home/widgets/article_item_widget.dart';

import '../../config/constants.dart';

class ArticleListWidget extends StatefulWidget {
  final String sourceId;

  ArticleListWidget({Key? key, required this.sourceId}) : super(key: key);

  @override
  State<ArticleListWidget> createState() => _ArticleListWidgetState();
}

class _ArticleListWidgetState extends State<ArticleListWidget> {
  // var viewModel=ArticleViewModel();
  @override
  void initState() {
    //viewModel.getNewsArticles(widget.sourceId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesCubit, ArticlesStates>(
        builder: (context, state) {
      switch (state) {
        case LoadingArticlesStates():
          {
            return const Center(child: CircularProgressIndicator());
          }
        case SuccessArticlesStates():
          {
            return Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) =>
                    ArticleItemWidget(articleModel: state.articlesList[index]),
                itemCount: state.articlesList.length,
              ),
            );
          }
        case ErrorArticlesStates():
          {
            return Center(
              child: Text(
                state.errorMessage.toString()
                //?? ""
                ,
                style: Constants.theme.textTheme.bodyMedium
                    ?.copyWith(color: Colors.black),
              ),
            );
          }
      }
    });
    // Consumer<ArticleViewModel>(
    // builder: (context,vm,_){
    // if(vm.articlesList.isEmpty){
    // return Center(
    // child: CircularProgressIndicator());
    // }
    //
    // return  Expanded(
    //         child: ListView.builder(itemBuilder: (context,index)=>
    //         ArticleItemWidget(articleModel: vm.articlesList[index]),
    //         itemCount: vm.articlesList.length,
    //           ),
    // );
    // },
    // );
  }
}
// FutureBuilder(future: ApiManager.fetchDataArticle(sourceId),
// builder: (context,snapshot) {
// if (snapshot.hasError) {
// return Center(
// child: Text("something went wrong",
// style: Constants.theme.textTheme.bodyMedium?.copyWith(
// color: Colors.black
// ),),
// );
// }
// if (snapshot.connectionState == ConnectionState.waiting) {
// return  Center(child: CircularProgressIndicator(
// color: Constants.theme.primaryColor,
// ),);
// }
// List <ArticleModel>articleList = snapshot.data ?? [];
// return Expanded(
// child: ListView.builder(itemBuilder: (context,index)=>
// ArticleItemWidget(articleModel: articleList[index]),
// itemCount: articleList.length,
// ),
// );
// }
// );
//
