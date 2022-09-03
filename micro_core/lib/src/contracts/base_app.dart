import 'package:flutter/material.dart';
import 'package:micro_core/micro_core.dart';

class NavigatorGlobal {
  static final NavigatorGlobal _instance = NavigatorGlobal._internal();
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  factory NavigatorGlobal() {
    return _instance;
  }

  NavigatorGlobal._internal();

  get key => _instance._navigatorKey;
}

abstract class BaseApp {
  List<MicroApp> get microApps;

  Map<String, WidgetBuilderArgs> get baseRoutes;

  final Map<String, WidgetBuilderArgs> routes = {};

  /// Inicializa os micro apps.
  /// Pode ser usado para passar variaveis globais da aplicacao
  void initializeMicroApps() {
    if (microApps.isNotEmpty) {
      for (MicroApp microApp in microApps) {
        microApp.init(navigator: NavigatorGlobal().key);
      }
    }
  }

  void registerRouters() {
    if (baseRoutes.isNotEmpty) routes.addAll(baseRoutes);
    if (microApps.isNotEmpty) {
      for (MicroApp microapp in microApps) {
        routes.addAll(microapp.routes);
      }
    }
  }

  Route<dynamic>? generateRoute(RouteSettings settings) {
    var routerName = settings.name;
    var routerArgs = settings.arguments;

    var navigateTo = routes[routerName];
    if (navigateTo == null) return null;

    return MaterialPageRoute(
      builder: (context) => navigateTo(context, routerArgs),
    );
  }

  void registerListener() {
    if (microApps.isNotEmpty) {
      for (MicroApp microApp in microApps) {
        microApp.createListener();
      }
    }
  }
}
