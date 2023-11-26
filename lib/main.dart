import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:provider/provider.dart';
import 'package:we_chat/app__localization/app_localization.dart';
import 'package:we_chat/core/contact_helper/contact_helper.dart';
import 'package:we_chat/core/file_manager/file_manager.dart';
import 'package:we_chat/core/loading_manager/loading_manager.dart';
import 'package:we_chat/core/routes/routes.dart';
import 'package:we_chat/firebase_options.dart';
import 'package:we_chat/injector.dart';
import 'package:we_chat/presentation/screen/add_profile/add_profile_controller.dart';
import 'package:we_chat/presentation/screen/main_screen/main_screen_controller.dart';
import 'package:we_chat/presentation/screen/phone_auth_screen/auth_controller/auth_controller.dart';
import 'package:we_chat/presentation/screen/register/register_controller.dart';
import 'package:we_chat/presentation/screen/selected_langauge/langauge_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialised();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FileManager.initialise();

  await ContactHelper.getFlutterContactList();
  

  runApp(const MyApp());
  await AppLocalizationsDelegate().load(const Locale("en"));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthController>(
          create: (context) => AuthController(),
        ),
        ChangeNotifierProvider(
          create: (context) => LangaugeController(),
        ),
        ChangeNotifierProvider(
          create: (context) => RegisterController(),
        ),
        ChangeNotifierProvider(
          create: (context) => AddProfileController(),
        ),
        ChangeNotifierProvider(
          create: (context) => MainScreenController(),
        )
      ],
      child: Consumer<LangaugeController>(
        builder: (context, value, child) {
          var langController =
              Provider.of<LangaugeController>(context, listen: false);
          return MaterialApp.router(
            routeInformationParser: Routes.goRouter.routeInformationParser,
            routeInformationProvider: Routes.goRouter.routeInformationProvider,
            routerDelegate: Routes.goRouter.routerDelegate,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: [
              AppLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              DefaultMaterialLocalizations.delegate
            ],
            locale: langController.locale,
            supportedLocales: const [
              Locale("en"),
              Locale("hi"),
            ],
            builder: EasyLoading.init(),
          );
        },
      ),
    );
  }

  getRandomInteger() {
    final random = Random();
  }
}
