// ignore_for_file: non_constant_identifier_names

class SwapCountModule {
  late int Total;
  late int Used;
  late int Available;
  SwapCountModule({
    required this.Total,
    required this.Used,
    required this.Available,
  });
  static Map<String, dynamic> toMap(SwapCountModule freeSwap) {
    var map = <String, dynamic>{};
    map['Total'] = freeSwap.Total;
    map['Used'] = freeSwap.Used;
    map['Available'] = freeSwap.Available;
    return map;
  }

  factory SwapCountModule.fromJson(dynamic json) {
    return SwapCountModule(
      Total: json['Total'],
      Used: json['Used'],
      Available: json['Available'],
    );
  }
}
