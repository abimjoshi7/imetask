import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:imepay/src/core/utils/global_providers.dart';
import 'package:imepay/src/features/home/presentation/pages/home_page.dart';

class ImePayApp extends StatelessWidget {
  const ImePayApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GlobalProviders(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        restorationScopeId: 'app',
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
        ],
        onGenerateTitle: (BuildContext context) =>
            AppLocalizations.of(context)!.appTitle,
        theme: ThemeData(),
        darkTheme: ThemeData.dark(),
        onGenerateRoute: (RouteSettings routeSettings) {
          return MaterialPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => const HomePage(),
          );
        },
      ),
    );
  }
}
