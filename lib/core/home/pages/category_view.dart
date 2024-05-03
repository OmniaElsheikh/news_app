import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/config/constants.dart';
import 'package:news_app/core/home/viewModels/categoryCubit/cubit.dart';
import 'package:news_app/core/home/viewModels/categoryCubit/states.dart';
import 'package:news_app/core/home/widgets/news_list_widget.dart';

import '../../../data/models/category_model.dart';

class CategoryView extends StatefulWidget {
  final CategoryModel categoryModel;

  CategoryView({Key? key, required this.categoryModel}) : super(key: key);

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  //var viewModel=CategoryViewModel();
  var cubitViewModel = CategoryCubit();

  @override
  // void initState() {
  //    viewModel.getNewsDataSource(widget.categoryModel.id);
  //    super.initState();
  //  }
  void initState() {
    cubitViewModel.getNewsDataSources(widget.categoryModel.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryStates>(
        bloc: cubitViewModel, // provide the local bloc instance
        builder: (context, state) {
          switch (state) {
            case LoadingCategoryStates():
              {
                return const Center(child: CircularProgressIndicator());
              }
            case SuccessCategoryStates():
              {
                return NewsListWidget(sourcesList: state.sourcesList);
              }
            case ErrorCategoryStates():
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
    //   ChangeNotifierProvider(
    //   create: (context)=>viewModel,
    //   child: Consumer<CategoryViewModel>(
    //     builder: (context,vm,_){
    //       if(vm.sourcesList.isEmpty){
    //         return Center(
    //             child: CircularProgressIndicator());
    //       }
    //
    //       return CustomBackgroundWidget(
    //         child: NewsListWidget(sourceList: vm.sourcesList),
    //       );
    //     },
    //   ),
    // );
  }
}
/*
          child: FutureBuilder(
            future:ApiManager.fetchDataSource(widget.categoryModel.id),
            builder: (context,snapshot){
              if(snapshot.hasError){
return Center(
  child:Text("something went wrong",
                  style: Constants.theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.black
                  ),),
                 );
              }
              if(snapshot.connectionState == ConnectionState.waiting){
                     return const Center(child: CircularProgressIndicator());
              }
          List <SourceModel>sourceList = snapshot.data?? [];
              return NewsListWidget(sourceList: sourceList);


            },

          ),
         */
