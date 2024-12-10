import 'dart:async';

import 'package:flutter/material.dart';
import 'package:bloc_base/core/auth_storage/auth_storage.dart';
import 'package:bloc_base/core/routers/my_routes.dart';
import 'package:go_router/go_router.dart';

class AuthMiddleware {
  static const AuthMiddleware _i = AuthMiddleware._internal();

  const AuthMiddleware._internal();

  factory AuthMiddleware() => _i;

  static FutureOr<String?> redirect(BuildContext context, GoRouterState state) async {
    if (AuthStorage.isLogin()) {
      return Routes.samplePage;
    } else {
      return null;
    }
  }
}
