import 'package:bloc/bloc.dart';
import 'package:news_app/core/home/viewModels/categoryCubit/states.dart';
import 'package:news_app/data/data_source/sources_data_source/online_sources_imp.dart';
import 'package:news_app/data/data_source/sources_data_source/sources_data_source.dart';
import 'package:news_app/data/repository_imp/sources_repository_imp.dart';
import 'package:news_app/repository/sources_repository.dart';

import '../../../../data/network/api_manager.dart';

//import 'package:flutter_bloc/flutter_bloc.dart';
class CategoryCubit extends Cubit<CategoryStates> {
  CategoryCubit() : super(LoadingCategoryStates());
  late ApiManager apiManager;
  late SourcesDataSource sourcesDataSource;
  late SourcesRepository sourcesRepository;

  getNewsDataSources(String categoryId) async {
    apiManager = ApiManager();
    sourcesDataSource = OnlineSourcesImp(apiManager);
    sourcesRepository = SourcesRepositoryImp(sourcesDataSource);
    emit(LoadingCategoryStates());
    try {
      var sourcesList = await sourcesRepository.getSourcesList(categoryId);
      emit(SuccessCategoryStates(sourcesList));
    } catch (error) {
      emit(ErrorCategoryStates(errorMessage: error.toString()));
    }
  }
}
