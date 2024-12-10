import 'package:bloc_base/core/utils/local_storage.dart';
import 'package:bloc_base/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:bloc_base/common_ui/theme/my_theme.dart';
import 'package:bloc_base/core/auth_storage/auth_storage.dart';
import 'package:bloc_base/core/routers/my_routes.dart';
import 'package:bloc_base/core/utils/my_scroll_behavior.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initialBindings();
  await Future.wait([
    LocalStorage.init(),
  ]);
  AuthStorage.loadData();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: MyTheme.light,
      darkTheme: MyTheme.dark,
      themeMode: ThemeMode.light,
      locale: const Locale('en', 'US'),
      supportedLocales: const [Locale('en', 'US')],
      scrollBehavior: MyScrollBehavior(),
      routerConfig: appPages,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
