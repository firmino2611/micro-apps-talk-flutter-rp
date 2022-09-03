library micro_app_home;

import 'package:flutter/material.dart';
import 'package:micro_app_home/src/modules/home/presenter/pages/home_page.dart';
import 'package:micro_core/micro_core.dart';

class MicroAppHome implements MicroApp {
  static GlobalKey<NavigatorState>? navigatorGlobal;

  @override
  String get microAppName => 'micro_app_home';

  @override
  Map<String, WidgetBuilderArgs> get routes {
    return {
      '/home': (context, args) {
        var user = args as Map;
        return HomePage(user: user['data'].toString());
      },
      '/informations': (context, args) => const Text('Informacoes'),
    };
  }

  @override
  void Function() get createListener => () {
        EventBus.listen((Payload event) {
          if (event.type == EventTypes.userAuthenticated) {
            MicroAppHome.navigatorGlobal!.currentState?.pushNamed(
              '/home',
              arguments: {'data': event.value},
            );
          }
          if (event.type == EventTypes.userUnregistered) {
            MicroAppHome.navigatorGlobal!.currentState?.pushNamed(
              '/register',
              arguments: 'Tela de registro',
            );
          }
        });
      };

  @override
  void init({
    required GlobalKey<NavigatorState> navigator,
  }) {
    navigatorGlobal = navigator;
  }
}
