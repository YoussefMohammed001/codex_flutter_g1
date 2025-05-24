import 'package:flutter/foundation.dart';
safePrint(String text) {
  if (kDebugMode) {
    print("<-------------->");
    print("<-------safe print------->");
    print(text);
    print("<-------safe print------->");
    print("<-------------->");
  }
}