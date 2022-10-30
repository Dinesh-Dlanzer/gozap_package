// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'package:intl/intl.dart';

class SwapHistoryMetaModule {
  late int TotalCount;
  late int FreeSwapCount;
  late int PaidSwapCount;
  late List<SwapHistoryModule> SwapHistoryList;
  SwapHistoryMetaModule(
      {required this.TotalCount,
      required this.FreeSwapCount,
      required this.PaidSwapCount,
      required this.SwapHistoryList});
}

class SwapHistoryModule {
  late int SwapID;
  late String RiderID;
  late String SwapReferID;
  late String SwapRechargeID;
  late String SwappedBatterID;
  late String ReturnBatterID;
  late bool IsFreeSwap;
  late DateTime SwapCreatedAt;
  late DateTime SwapUpdatedAt;
  late String SwapFormattedCreatedAt;

  SwapHistoryModule(
      {required this.SwapID,
      required this.RiderID,
      required this.SwapReferID,
      required this.SwapRechargeID,
      required this.SwappedBatterID,
      required this.ReturnBatterID,
      required this.IsFreeSwap,
      required this.SwapCreatedAt,
      required this.SwapUpdatedAt,
      required this.SwapFormattedCreatedAt});

  static Map<String, dynamic> toMap(SwapHistoryModule swapHistory) {
    var map = <String, dynamic>{};
    map['SwapID'] = swapHistory.SwapID;
    map['RiderID'] = swapHistory.RiderID;
    map['SwapReferID'] = swapHistory.SwapReferID;
    map['SwapRechargeID'] = swapHistory.SwapRechargeID;
    map['SwappedBatterID'] = swapHistory.SwappedBatterID;
    map['ReturnBatterID'] = swapHistory.ReturnBatterID;
    map['IsFreeSwap'] = swapHistory.IsFreeSwap;
    map['SwapCreatedAt'] = swapHistory.SwapCreatedAt;
    map['SwapUpdatedAt'] = swapHistory.SwapUpdatedAt;
    return map;
  }

  factory SwapHistoryModule.fromJson(dynamic json) {
    return SwapHistoryModule(
      SwapID: json['SwapID'],
      RiderID: json['RiderID'],
      SwapRechargeID: json['SwapRechargeID'],
      SwapReferID: json['SwapReferID'],
      ReturnBatterID: json['ReturnBatterID'],
      SwappedBatterID: json['SwappedBatterID'],
      IsFreeSwap: (json['IsFreeSwap'] == "0") ? false : true,
      SwapCreatedAt: DateTime.parse(json['SwapCreatedAt']),
      SwapUpdatedAt: DateTime.parse(json['SwapUpdatedAt']),
      SwapFormattedCreatedAt: DateFormat('MMM dd, yyyy hh:mm a')
          .format(DateTime.parse(json['SwapCreatedAt'])),
    );
  }
}
