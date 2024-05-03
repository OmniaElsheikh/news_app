import '../data/models/source_model.dart';

abstract class SourcesRepository {
  Future<List<SourceModel>> getSourcesList(String categoryId);
}
