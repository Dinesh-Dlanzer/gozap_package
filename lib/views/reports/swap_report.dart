// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:easy_table/easy_table.dart';
import 'package:gozap_package/models/swap/swap_history_model.dart';

class SwapReportWidget extends StatefulWidget {
  SwapReportWidget({super.key, required this.SwapHistoryList});
  List<SwapHistoryModule> SwapHistoryList;
  @override
  State<SwapReportWidget> createState() => _SwapReportWidgetState();
}

class _SwapReportWidgetState extends State<SwapReportWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 200,
      child: EasyTable<SwapHistoryModule>(
          EasyTableModel<SwapHistoryModule>(
              rows: widget.SwapHistoryList,
              columns: [
                EasyTableColumn(
                    name: 'Rider ID',
                    stringValue: (row) => row.RiderID),
                EasyTableColumn(
                  name: 'Return Battery ID',
                  stringValue: (row) => row.ReturnBatterID,
                ),
                EasyTableColumn(
                  name: 'Swap Battery ID',
                  stringValue: (row) => row.SwappedBatterID,
                ),
                EasyTableColumn(
                    name: 'Is FreeSwap',
                    iconValue: (row) => row.IsFreeSwap? CellIcon(icon: Icons.done):CellIcon(icon: Icons.close)),
                EasyTableColumn(
                    name: 'Date & Time',
                    stringValue: (row) => row.SwapFormattedCreatedAt),
              ]),
          columnsFit: true,
          visibleRowsCount: 0),
    );
  }
}
