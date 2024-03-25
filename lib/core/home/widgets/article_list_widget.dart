import 'package:flutter/material.dart';
import 'package:news_app/core/home/widgets/article_item_widget.dart';
import 'package:news_app/core/models/article_model.dart';
import 'package:news_app/network/api_manager.dart';

import '../../config/constants.dart';
class ArticleListWidget extends StatelessWidget {
  final String sourceId;
  const ArticleListWidget({Key? key,
  required this.sourceId
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: ApiManager.fetchDataArticle(sourceId),
    builder: (context,snapshot) {
      if (snapshot.hasError) {
        return Center(
          child: Text("something went wrong",
            style: Constants.theme.textTheme.bodyMedium?.copyWith(
                color: Colors.black
            ),),
        );
      }
      if (snapshot.connectionState == ConnectionState.waiting) {
        return  Center(child: CircularProgressIndicator(
          color: Constants.theme.primaryColor,
        ),);
      }
      List <ArticleModel>articleList = snapshot.data ?? [];
      return Expanded(
        child: ListView.builder(itemBuilder: (context,index)=>
           ArticleItemWidget(articleModel: articleList[index]),
          itemCount: articleList.length,
        ),
      );
    }
     );
  }
}
