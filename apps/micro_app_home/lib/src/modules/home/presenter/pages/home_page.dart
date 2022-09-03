import 'package:flutter/material.dart';
import 'package:micro_app_home/micro_app_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final String user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MicroAppHome().microAppName),
      ),
      body: Center(
        child: Text(widget.user),
      ),
    );
  }
}
