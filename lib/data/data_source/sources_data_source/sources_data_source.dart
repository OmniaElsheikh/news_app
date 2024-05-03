import '../../models/source_model.dart';

abstract class SourcesDataSource {
  Future<List<SourceModel>> getSourcesList(String categoryId);
}
