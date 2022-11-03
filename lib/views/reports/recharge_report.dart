// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:easy_table/easy_table.dart';
import 'package:gozap_package/models/recharge/recharge_history_model.dart';

class RechargeReportWidget extends StatefulWidget {
  RechargeReportWidget({super.key, required this.rechargeHistoryModuleList});
  List<RechargeHistoryModule> rechargeHistoryModuleList;
  @override
  State<RechargeReportWidget> createState() => _RechargeReportWidgetState();
}

class _RechargeReportWidgetState extends State<RechargeReportWidget> {
  @override
  Widget build(BuildContext context) {
    return EasyTable<RechargeHistoryModule>(
        EasyTableModel<RechargeHistoryModule>(
            rows: widget.rechargeHistoryModuleList,
            columns: [
              EasyTableColumn(
                  name: 'Recharge ID',
                  stringValue: (row) => row.RechargeID.toString()),
              EasyTableColumn(
                name: 'Rider ID',
                stringValue: (row) => row.RiderID,
              ),
              EasyTableColumn(
                name: 'Transaction ID',
                stringValue: (row) => row.TransactionID.toString(),
              ),
              EasyTableColumn(
                  name: 'Payment Type',
                  stringValue: (row) => row.PaymentTypeID=="1"? "Cash":"Online"),
              EasyTableColumn(
                  name: 'Date & Time',
                  stringValue: (row) => row.RechargeFormattedCreatedAt),
            ]),
        columnsFit: true,
        verticalScrollController:ScrollController(),
        visibleRowsCount: 0
    );
  }
}
