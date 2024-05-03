import 'package:news_app/data/data_source/sources_data_source/sources_data_source.dart';
import 'package:news_app/data/models/source_model.dart';
import 'package:news_app/repository/sources_repository.dart';

class SourcesRepositoryImp implements SourcesRepository {
  SourcesDataSource sourcesDataSource;

  SourcesRepositoryImp(this.sourcesDataSource);

  @override
  Future<List<SourceModel>> getSourcesList(String categoryId) async {
    return await sourcesDataSource.getSourcesList(categoryId);
  }
}
