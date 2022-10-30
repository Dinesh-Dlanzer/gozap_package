
// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'package:intl/intl.dart';
import 'package:gozap_package/models/asset/asset_category_model.dart';

class AssetMetaModule {
  late int TotalAssetCount;
  late int BatteryAssetCount;
  late int vehicleAssetCount;
  late List<AssetModule> AssetList;

  AssetMetaModule(
      {required this.TotalAssetCount,
      required this.BatteryAssetCount,
      required this.vehicleAssetCount,
      required this.AssetList});
}

class AssetModule {
  late String AssetID;
  late String AssetName;
  late int AssetCategoryID;
  late AssetCategoryModule AssetCategory;
  late bool IsInServiceCenter;
  late DateTime AssetCreatedAt;
  late DateTime AssetUpdatedAt;
  late String AssetormattedCreatedAt;
  AssetModule({
    required this.AssetID,
    required this.AssetName,
    required this.AssetCategoryID,
    required this.AssetCategory,
    required this.IsInServiceCenter,
    required this.AssetCreatedAt,
    required this.AssetUpdatedAt,
    required this.AssetormattedCreatedAt,
  });

  static Map<String, dynamic> toMap(AssetModule user) {
    var map = <String, dynamic>{};
    map['AssetID'] = user.AssetID;
    map['AssetName'] = user.AssetName;
    map['AssetCategoryID'] = user.AssetCategoryID;
    map['IsInServiceCenter'] = user.IsInServiceCenter ? 1 : 0;
    map['AssetCreatedAt'] = user.AssetCreatedAt.toString();
    map['AssetUpdatedAt'] = user.AssetUpdatedAt.toString();
    return map;
  }

  factory AssetModule.fromJson(
    dynamic json,
  ) {
    return AssetModule(
      AssetID: json['AssetID'],
      AssetName: json['AssetName'],
      AssetCategoryID: json['AssetCategoryID'],
      AssetCategory: AssetCategoryModule.fromJson(json['AssetCategory']),
      IsInServiceCenter: json['IsInServiceCenter'] == 1 ? true : false,
      AssetCreatedAt: DateTime.parse(json['AssetCreatedAt']),
      AssetUpdatedAt: DateTime.parse(json['AssetUpdatedAt']),
      AssetormattedCreatedAt: DateFormat('MMM dd, yyyy hh:mm a')
          .format(DateTime.parse(json['AssetCreatedAt'])),
    );
  }
}
