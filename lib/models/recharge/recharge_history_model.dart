// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'package:intl/intl.dart';

class RechargeHistoryMetaModule {
  late int TotalRechargeCount;
  late List<RechargeHistoryModule> RechargeHistoryList;

  RechargeHistoryMetaModule(
      {required this.TotalRechargeCount,
      required this.RechargeHistoryList});
}

class RechargeHistoryModule {
  late int RechargeID;
  late String RiderID;
  late String TransactionID;
  late String PaymentTypeID;
  late DateTime RechargeCreatedAt;
  late DateTime RechargeUpdatedAt;
  late String RechargeFormattedCreatedAt;
  RechargeHistoryModule(
      {required this.RechargeID,
      required this.RiderID,
      required this.TransactionID,
      required this.PaymentTypeID,
      required this.RechargeCreatedAt,
      required this.RechargeUpdatedAt,
      required this.RechargeFormattedCreatedAt});

  static Map<String, dynamic> toMap(RechargeHistoryModule user) {
    var map = <String, dynamic>{};
    map['RechargeID'] = user.RechargeID;
    map['RiderID'] = user.RiderID;
    map['TransactionID'] = user.TransactionID;
    map['PaymentTypeID'] = user.PaymentTypeID;
    map['RechargeCreatedAt'] = user.RechargeCreatedAt.toString();
    map['RechargeUpdatedAt'] = user.RechargeUpdatedAt.toString();
    return map;
  }

  factory RechargeHistoryModule.fromJson(dynamic json) {
    return RechargeHistoryModule(
      RechargeID: json['RechargeID'],
      RiderID: json['RiderID'],
      TransactionID: json['TransactionID']??"",
      PaymentTypeID: json['PaymentTypeID'],
      RechargeCreatedAt: DateTime.parse(json['RechargeCreatedAt']),
      RechargeUpdatedAt: DateTime.parse(json['RechargeUpdatedAt']),
      RechargeFormattedCreatedAt: DateFormat('MMM dd, yyyy hh:mm a')
          .format(DateTime.parse(json['RechargeCreatedAt'])),
    );
  }
}
