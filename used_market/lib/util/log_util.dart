import 'package:flutter/foundation.dart';

void printLog(Object? log) {
  if (kDebugMode) {
    print(log);
  }
}
