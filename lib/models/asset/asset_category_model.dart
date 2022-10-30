// ignore_for_file: non_constant_identifier_names

class AssetCategoryModule {
  late int AssetCategoryID ;
  late String AssetCategoryTitle;
  late DateTime AssetCategoryCreatedAt;
  late DateTime AssetCategoryUpdatedAt;
  AssetCategoryModule(
      {required this.AssetCategoryID,
      required this.AssetCategoryTitle,
      required this.AssetCategoryCreatedAt,
      required this.AssetCategoryUpdatedAt});

  static Map<String, dynamic> toMap(AssetCategoryModule user) {
    var map = <String, dynamic>{};
    map['AssetCategoryID'] = user.AssetCategoryID;
    map['AssetCategoryTitle'] = user.AssetCategoryTitle;
    map['AssetCategoryCreatedAt'] = user.AssetCategoryCreatedAt.toString();
    map['AssetCategoryUpdatedAt'] = user.AssetCategoryUpdatedAt.toString();
    return map;
  }

  factory AssetCategoryModule.fromJson(dynamic json) {
    return AssetCategoryModule(
      AssetCategoryID: json['AssetCategoryID'],
      AssetCategoryTitle: json['AssetCategoryTitle'],
      AssetCategoryCreatedAt: DateTime.parse(json['AssetCategoryCreatedAt']),
      AssetCategoryUpdatedAt: DateTime.parse(json['AssetCategoryUpdatedAt']),
    );
  }
}