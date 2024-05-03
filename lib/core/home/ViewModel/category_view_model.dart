// import 'package:flutter/material.dart';
// // import 'package:news_app/network/api_manager.dart';
//
// // import '../../../data/models/source_model.dart';
// import '../../../data/models/source_model.dart';
// import '../../../data/network/api_manager.dart';
//
// class CategoryViewModel extends ChangeNotifier{
//   List<SourceModel> _sourcesList=[];
//   List<SourceModel>get sourcesList=>_sourcesList;
//
//   getNewsDataSource(String categoryId) async{
//     try {
//    _sourcesList = await ApiManager.fetchDataSource(categoryId);
//    notifyListeners();
//     }catch(e){
//       print(e.toString());
//     }
//   }
// }
