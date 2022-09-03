import 'package:flutter/material.dart';

import '../types/types.dart';

abstract class MicroApp {
  /// Nome do Micro App
  String get microAppName;

  /// Rotas publicas do Micro App
  Map<String, WidgetBuilderArgs> get routes;

  void Function() get createListener;

  /// Inicializa e injeta dependencias globais
  void init({
    required GlobalKey<NavigatorState> navigator,
  });
}
