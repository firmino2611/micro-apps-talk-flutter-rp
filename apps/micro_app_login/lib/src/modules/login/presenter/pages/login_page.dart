import 'package:flutter/material.dart';
import 'package:micro_app_login/micro_app_login.dart';
import 'package:micro_core/micro_core.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MicroAppLogin().microAppName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Ir para home'),
              onPressed: () {
                Navigator.of(context).pushNamed('/home', arguments: {
                  'data': {'user': 'Lucas Firmino'}
                });
                // EventBus.emit(
                //   Payload(
                //     sentBy: MicroAppLogin().microAppName,
                //     type: EventTypes.userAuthenticated,
                //     value: {'user': 'Lucas Firmino'},
                //   ),
                // );
              },
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              child: const Text('Ir para registro'),
              onPressed: () {
                // Navigator.of(context).pushNamed('/home');
                EventBus.emit(
                  Payload(
                    sentBy: MicroAppLogin().microAppName,
                    type: EventTypes.userUnregistered,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
