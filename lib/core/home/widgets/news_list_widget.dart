import 'dart:html';

import 'package:flutter/material.dart';
import 'package:news_app/core/home/widgets/article_list_widget.dart';
import '../../models/source_model.dart';
import '../../widgets/tab_item.dart';
class NewsListWidget extends StatefulWidget {
  final List<SourceModel> sourceList;
  const NewsListWidget({Key? key, required this.sourceList}) : super(key: key);

  @override
  State<NewsListWidget> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListWidget> {
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        DefaultTabController(
          length: widget.sourceList.length,
          child:TabBar(
              padding:const EdgeInsets.symmetric(vertical: 15),
              isScrollable: true,
            indicator: const BoxDecoration(),
             dividerColor: Colors.transparent,
              labelPadding: const EdgeInsets.symmetric(horizontal: 8),
              onTap: (index){
                selectedIndex=index;
                setState(() {
              });
              },
              tabs: widget.sourceList
                  .map(
                    (e) => TabItem(sourceModel:e,isSelected: selectedIndex==widget.sourceList.indexOf(e),),
              )
                  .toList()),),
        ArticleListWidget(sourceId: widget.sourceList[selectedIndex].id)
      ],
    );
  }
}
