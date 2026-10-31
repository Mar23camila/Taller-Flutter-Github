import 'package:flutter/material.dart';

import 'routes/app_routes.dart';

void main() {
  runApp(const MyTwoApp());
}

class MyTwoApp extends StatelessWidget {
  const MyTwoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Silent Hill F',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
    );
  }
}
