import 'package:news_app/data/data_source/sources_data_source/sources_data_source.dart';

import '../../models/source_model.dart';
import '../../network/api_manager.dart';

class OnlineSourcesImp implements SourcesDataSource {
  ApiManager apiManager;

  OnlineSourcesImp(this.apiManager);

  @override
  Future<List<SourceModel>> getSourcesList(String categoryId) async {
    return await apiManager.fetchDataSource(categoryId);
  }
}
