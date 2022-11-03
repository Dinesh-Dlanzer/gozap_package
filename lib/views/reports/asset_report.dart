// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:easy_table/easy_table.dart';
import 'package:gozap_package/models/asset/asset_model.dart';

class AssetReportWidget extends StatefulWidget {
  AssetReportWidget({super.key, required this.assetModuleList});
  List<AssetModule> assetModuleList;
  @override
  State<AssetReportWidget> createState() => _AssetReportWidgetState();
}

class _AssetReportWidgetState extends State<AssetReportWidget> {
  @override
  Widget build(BuildContext context) {
    return EasyTable<AssetModule>(
        EasyTableModel<AssetModule>(
            verticalScrollController:ScrollController(),
            rows: widget.assetModuleList,
            columns: [
              EasyTableColumn(
                  name: 'Asset ID',
                  stringValue: (row) => row.AssetID.toString()),
              EasyTableColumn(
                name: 'Category',
                stringValue: (row) => row.AssetCategory.AssetCategoryTitle,
              ),
              EasyTableColumn(
                name: 'in Service Center',
                iconValue: (row) => row.IsInServiceCenter? CellIcon(icon: Icons.done):CellIcon(icon: Icons.close)),
              EasyTableColumn(
                  name: 'Date & Time',
                  stringValue: (row) => row.AssetormattedCreatedAt),
            ]),
        columnsFit: true,
        visibleRowsCount: 0);
  }
}
