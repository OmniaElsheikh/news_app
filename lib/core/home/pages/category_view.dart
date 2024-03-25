import 'package:flutter/material.dart';
import 'package:news_app/core/config/constants.dart';
import 'package:news_app/core/home/widgets/news_list_widget.dart';
import 'package:news_app/core/models/category_model.dart';
import 'package:news_app/core/models/source_model.dart';
import 'package:news_app/core/widgets/custom_background.dart';
import 'package:news_app/core/widgets/tab_item.dart';
import 'package:news_app/network/api_manager.dart';

class CategoryView extends StatefulWidget {
  final CategoryModel categoryModel;
   CategoryView({Key? key,required this.categoryModel}) : super(key: key);

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {

    return CustomBackgroundWidget(
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
    );
  }
}
