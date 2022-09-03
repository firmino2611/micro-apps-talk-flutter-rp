import 'package:flutter/material.dart';
import 'package:micro_app_home/micro_app_home.dart';
import 'package:micro_app_login/micro_app_login.dart';
import 'package:micro_core/micro_core.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget with BaseApp {
  MainApp({Key? key}) : super(key: key) {
    super.registerRouters();
    super.initializeMicroApps();
    super.registerListener();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: NavigatorGlobal().key,
      onGenerateRoute: super.generateRoute,
      initialRoute: '/login',
    );
  }

  @override
  Map<String, WidgetBuilderArgs> get baseRoutes => {};

  @override
  List<MicroApp> get microApps => [
        MicroAppLogin(),
        MicroAppHome(),
      ];
}
