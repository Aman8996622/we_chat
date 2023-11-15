import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:we_chat/presentation/screen/add_profile/add_profile.dart';
import 'package:we_chat/presentation/screen/introduction/introduction.dart';
import 'package:we_chat/presentation/screen/phone_auth_screen/phone_auth_screen.dart';
import 'package:we_chat/presentation/screen/register/register.dart';
import 'package:we_chat/presentation/screen/selected_langauge/select_langauge.dart';

class Routes {
  Routes._();

  static GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();

  static GoRouter returnRoutes() {
    return GoRouter(
      navigatorKey: navigatorKey,
      initialLocation: AppNameRoutes.addProfile,
      routes: [
        GoRoute(
          name: AppNameRoutes.introduction,
          path: AppNameRoutes.introduction,
          pageBuilder: (context, state) {
            return const NoTransitionPage(child: Introduction());
          },
        ),
        GoRoute(
          path: AppNameRoutes.phoneAuth,
          name: AppNameRoutes.phoneAuth,
          pageBuilder: (context, state) {
            return const NoTransitionPage(child: PhoneAuth());
          },
        ),
        GoRoute(
          path: AppNameRoutes.register,
          name: AppNameRoutes.register,
          pageBuilder: (context, state) {
            return NoTransitionPage(child: Register());
          },
        ),
        GoRoute(
          path: AppNameRoutes.selectLanguage,
          name: AppNameRoutes.selectLanguage,
          pageBuilder: (context, state) {
            return const NoTransitionPage(
              child: SelectLanguage(),
            );
          },
        ),
        GoRoute(
          path: AppNameRoutes.addProfile,
          name: AppNameRoutes.addProfile,
          pageBuilder: (context, state) {
            return const NoTransitionPage(
              child: AddProfile(),
            );
          },
        )
      ],
    );
  }
}

class AppNameRoutes {
  static const String introduction = "/introduction";

  static const String phoneAuth = "/phone_auth";

  static const String selectLanguage = "/select_language";

  static const String register = "/register";

  static const String addProfile = "/add_profile";

//static const String phoneAuth = "/phone";
}
