library micro_app_login;

import 'package:flutter/material.dart';
import 'package:micro_app_login/src/modules/login/presenter/pages/login_page.dart';
import 'package:micro_app_login/src/modules/register/presenter/pages/register_page.dart';
import 'package:micro_core/micro_core.dart';

abstract class RouteNames {
  static String login = '/login';
  static String register = '/register';
  static String terms = '/terms';
}

class MicroAppLogin implements MicroApp {
  static GlobalKey<NavigatorState>? navigatorGlobal;

  @override
  String get microAppName => 'micro_app_login';

  @override
  Map<String, WidgetBuilderArgs> get routes {
    return {
      '/login': (context, args) => const LoginPage(),
      RouteNames.register: (context, args) {
        var title = args as String;
        return RegisterPage(
          title: title,
        );
      },
      RouteNames.terms: (context, args) => const Text('Termos de servico'),
    };
  }

  @override
  void Function() get createListener => () {
        EventBus.listen((Payload event) {});
      };

  @override
  void init({
    required GlobalKey<NavigatorState> navigator,
  }) {
    navigatorGlobal = navigator;
  }
}
