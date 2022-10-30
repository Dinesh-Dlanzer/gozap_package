import 'dart:developer';

extension FunctionUtils on Function {
  void callAndAbsorbError() {
    try {
      this.call();
    } catch (e, st) {
      log("Error in $this", error: e, stackTrace: st);
    }
  }
}
