class SourceModel{
  final String id,name;
  SourceModel({
    required this.id,
    required this.name
  });
  factory SourceModel.fromJson(Map<String,dynamic>json)=>
      SourceModel(id: json["id"], name: json["name"]);
}