// ignore_for_file: non_constant_identifier_names

import 'package:gozap_package/models/user/user_model.dart';
import 'package:gozap_package/models/asset/asset_model.dart';
import 'package:gozap_package/models/swap/swap_history_model.dart';
import 'package:gozap_package/models/recharge/recharge_history_model.dart';
import 'package:gozap_package/models/service/service_history_model.dart';

class AdminModule {
  late UserModule User;
  late SwapHistoryMetaModule SwapHistoryMeta;
  late RechargeHistoryMetaModule RechargeHistoryMeta;
  late ServiceHistoryMetaModule ServiceHistoryMeta;
  late AssetMetaModule AssetMeta;
  AdminModule(
      {required this.User,
      required this.SwapHistoryMeta,
      required this.RechargeHistoryMeta,
      required this.ServiceHistoryMeta,
      required this.AssetMeta,
      });
}
