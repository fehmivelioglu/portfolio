import 'package:flutter/material.dart';
import 'package:portfolio/core/managers/route_manager.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Portfolio App',
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter().router,
    );
  }
}
