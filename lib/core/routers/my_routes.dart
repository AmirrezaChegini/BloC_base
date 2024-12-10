import 'package:bloc_base/core/utils/context_provider.dart';
import 'package:bloc_base/features/sample/presentation/binding/sample_binding.dart';
import 'package:bloc_base/features/sample/presentation/bloc/sample_bloc.dart';
import 'package:bloc_base/features/sample/presentation/ui/sample_page.dart';
import 'package:bloc_base/locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const Routes _i = Routes._internal();

  const Routes._internal();

  factory Routes() => _i;

  static const String samplePage = '/sample_page';
}

GoRouter get appPages => GoRouter(
      initialLocation: Routes.samplePage,
      navigatorKey: ContextProvider.navigatorKey,
      routes: [
        GoRoute(
          name: Routes.samplePage,
          path: Routes.samplePage,
          onExit: SampleBindings.dispose,
          builder: (context, state) => BlocProvider(
            create: (context) {
              SampleBindings();
              return SampleBloc(locator());
            },
            child: const SamplePage(),
          ),
        ),
      ],
    );
