// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'package:intl/intl.dart';

class ServiceHistoryMetaModule {
  late int TotalCount;
  late int ServicedCount;
  late int InCompletedCount;
  late List<ServiceHistoryModule> ServiceHistoryList;

  ServiceHistoryMetaModule(
      {required this.TotalCount,
      required this.ServicedCount,
      required this.InCompletedCount,
      required this.ServiceHistoryList});
}

class ServiceHistoryModule {
  late int ServiceHistoryID;
  late String AssetID;
  late bool isServiced;
  late String outWard;
  late String InWard;
  late DateTime ServiceHistoryCreatedAt;
  late DateTime ServiceHistoryUpdatedAt;
  late String ServiceHistoryFormattedCreatedAt;
  ServiceHistoryModule({
    required this.ServiceHistoryID,
    required this.AssetID,
    required this.isServiced,
    required this.outWard,
    required this.InWard,
    required this.ServiceHistoryCreatedAt,
    required this.ServiceHistoryUpdatedAt,
    required this.ServiceHistoryFormattedCreatedAt,
  });

  static Map<String, dynamic> toMap(ServiceHistoryModule user) {
    var map = <String, dynamic>{};
    map['ServiceHistoryID'] = user.ServiceHistoryID;
    map['AssetID'] = user.AssetID;
    map['isServiced'] = user.isServiced ? 1 : 0;
    map['outWard'] = user.outWard;
    map['InWard'] = user.InWard;
    map['ServiceHistoryCreatedAt'] = user.ServiceHistoryCreatedAt.toString();
    map['ServiceHistoryUpdatedAt'] = user.ServiceHistoryUpdatedAt.toString();
    return map;
  }

  factory ServiceHistoryModule.fromJson(dynamic json) {
    return ServiceHistoryModule(
      ServiceHistoryID: json['ServiceHistoryID'],
      AssetID: json['AssetID'],
      isServiced: json['isServiced'] == 1 ? true : false,
      outWard: DateFormat('MMM dd, yyyy hh:mm a')
          .format(DateTime.parse(json['outWard'])),
      InWard: json['InWard']!=null?DateFormat('MMM dd, yyyy hh:mm a')
          .format(DateTime.parse(json['InWard'])):"",
      ServiceHistoryCreatedAt: DateTime.parse(json['ServiceHistoryCreatedAt']),
      ServiceHistoryUpdatedAt: DateTime.parse(json['ServiceHistoryUpdatedAt']),
      ServiceHistoryFormattedCreatedAt: DateFormat('MMM dd, yyyy hh:mm a')
          .format(DateTime.parse(json['ServiceHistoryCreatedAt'])),
    );
  }
}
