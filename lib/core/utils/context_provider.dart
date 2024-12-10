import 'package:flutter/cupertino.dart';

class ContextProvider {
  static const ContextProvider _i = ContextProvider._internal();

  const ContextProvider._internal();

  factory ContextProvider() => _i;

  static GlobalKey<NavigatorState>? navigatorKey;
  static BuildContext? context = navigatorKey?.currentContext;
}
