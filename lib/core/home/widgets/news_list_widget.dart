import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/home/viewModels/articlesCubit/cubit.dart';
import 'package:news_app/core/home/viewModels/articlesCubit/states.dart';
import 'package:news_app/core/home/widgets/article_list_widget.dart';

import '../../../data/models/source_model.dart';
import '../../widgets/tab_item.dart';

class NewsListWidget extends StatefulWidget {
  final List<SourceModel> sourcesList;

  const NewsListWidget({Key? key, required this.sourcesList}) : super(key: key);

  @override
  State<NewsListWidget> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListWidget> {
  int selectedIndex = 0;

  // var viewModel=ArticleViewModel();
  // void initState() {
  //   viewModel.getNewsArticles(widget.sourcesList[selectedIndex].id);
  //   super.initState();
  // }
  var cubitViewModel = ArticlesCubit();

  void initState() {
    cubitViewModel.getNewsArticles(widget.sourcesList[selectedIndex].id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return
    // ChangeNotifierProvider(
    // create: (context)=>viewModel,
    //   child: Consumer<ArticleViewModel>(
    //     builder: (context,vm,_){
    return BlocBuilder<ArticlesCubit, ArticlesStates>(
        bloc: cubitViewModel, // provide the local bloc instance
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DefaultTabController(
                length: widget.sourcesList.length,
                child: TabBar(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    isScrollable: true,
                    indicator: const BoxDecoration(),
                    dividerColor: Colors.transparent,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                    onTap: (index) {
                      setState(() {
                        selectedIndex = index;

                        cubitViewModel
                            .getNewsArticles(widget.sourcesList[index].id);
                      });
                    },
                    tabs: widget.sourcesList
                        .map(
                          (e) => TabItem(
                            sourceModel: e,
                            isSelected:
                                selectedIndex == widget.sourcesList.indexOf(e),
                          ),
                        )
                        .toList()),
              ),
              ArticleListWidget(sourceId: widget.sourcesList[selectedIndex].id)
            ],
          );
        });
  }
}
