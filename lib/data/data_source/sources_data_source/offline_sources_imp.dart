import 'package:news_app/data/data_source/sources_data_source/sources_data_source.dart';

import '../../models/source_model.dart';

class OfflineSourcesImp implements SourcesDataSource {
  @override
  Future<List<SourceModel>> getSourcesList(String categoryId) {
    // TODO: implement getSourcesList
    throw UnimplementedError();
  }
}
