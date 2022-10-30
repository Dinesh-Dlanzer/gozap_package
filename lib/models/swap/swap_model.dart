// ignore_for_file: non_constant_identifier_names

import 'package:gozap_package/models/user/user_model.dart';
import 'package:gozap_package/models/swap/swap_count_model.dart';
import 'package:gozap_package/models/swap/swap_history_model.dart';

class SwapModule {
  late UserModule User;
  late SwapCountModule RemaingSwap;
  late SwapCountModule ReferSwap;
  late SwapCountModule RechargeSwap;
  late SwapCountModule FreeSwap;
  late SwapHistoryMetaModule SwapHistoryMeta;
  SwapModule(
      {required this.User,
      required this.RemaingSwap,
      required this.ReferSwap,
      required this.RechargeSwap,
      required this.FreeSwap,
      required this.SwapHistoryMeta});
}
