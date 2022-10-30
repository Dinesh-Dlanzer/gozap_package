// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:easy_table/easy_table.dart';
import 'package:gozap_package/models/service/service_history_model.dart';

class ServiceReportWidget extends StatefulWidget {
  ServiceReportWidget({super.key, required this.serviceHistoryModuleList});
  List<ServiceHistoryModule> serviceHistoryModuleList;
  @override
  State<ServiceReportWidget> createState() => _ServiceReportWidgetState();
}

class _ServiceReportWidgetState extends State<ServiceReportWidget> {
  @override
  Widget build(BuildContext context) {
    return EasyTable<ServiceHistoryModule>(
        EasyTableModel<ServiceHistoryModule>(
            rows: widget.serviceHistoryModuleList,
            columns: [
              EasyTableColumn(
                  name: 'Asset ID',
                  stringValue: (row) => row.AssetID.toString()),
              EasyTableColumn(
                  name: 'Is Serviced',
                  iconValue: (row) => row.isServiced
                      ? CellIcon(icon: Icons.done)
                      : CellIcon(icon: Icons.close)),
              EasyTableColumn(name: 'In Ward', stringValue: (row) => row.InWard),
              EasyTableColumn(name: 'out Ward', stringValue: (row) => row.outWard),
              EasyTableColumn(
                  name: 'Date & Time',
                  stringValue: (row) => row.ServiceHistoryFormattedCreatedAt),
            ]),
        columnsFit: true,
        visibleRowsCount: 0);
  }
}
