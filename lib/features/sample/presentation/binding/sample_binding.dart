import 'dart:async';

import 'package:bloc_base/features/sample/data/datasource/sample_datasource.dart';
import 'package:bloc_base/features/sample/data/repository_impl/sample_repository_impl.dart';
import 'package:bloc_base/features/sample/domain/repository/sample_repository.dart';
import 'package:bloc_base/features/sample/domain/usecases/get_sample_usecase.dart';
import 'package:bloc_base/locator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SampleBindings {
  SampleBindings() {
    init();
  }

  void init() {
    try {
      locator.registerSingleton<ISampleDatasource>(SampleDatasourceImpl(locator()));
      locator.registerSingleton<ISampleRepository>(SampleRepositoryImpl(locator()));
      locator.registerSingleton<GetSampleUseCase>(GetSampleUseCase(locator()));
    } catch (_) {}
  }

  static FutureOr<bool> dispose(BuildContext context, GoRouterState state) async {
    try {
      await locator.unregister<ISampleDatasource>(ignoreReferenceCount: true);
      await locator.unregister<ISampleRepository>(ignoreReferenceCount: true);
      await locator.unregister<GetSampleUseCase>(ignoreReferenceCount: true);
    } catch (_) {}
    return true;
  }
}
