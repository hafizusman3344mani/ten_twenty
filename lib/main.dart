import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ten_twenty/constants/app_colors.dart';
import 'package:ten_twenty/modules/dashboard/pages/dashboard_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'L10n/l10n.dar.dart';
import 'core/di/bloc_di.dart';
import 'core/di/service_locator.dart';
import 'core/network/my_http_overrides.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  setupLocator();
  await sl.allReady();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocDI(
      child: MaterialApp(
        title: 'Ten Twenty',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: AppColors.scaffoldColor,
            appBarTheme: const AppBarTheme(

                backgroundColor: AppColors.light,
                surfaceTintColor: Colors.transparent)),
        themeMode: ThemeMode.light,
        locale: const Locale('en'),
        supportedLocales: L10n.all,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        home: const DashboardPage(),
      ),
    );
  }
}
