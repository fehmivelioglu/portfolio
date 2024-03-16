import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/constants/route_constants.dart';
import 'package:portfolio/view/detail/detail_screen.dart';
import 'package:portfolio/view/home/home_screen.dart';

@immutable
class AppRouter {
  final router = GoRouter(
    initialLocation: RouteConstants.home,
    routes: [
      GoRoute(
        path: RouteConstants.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: RouteConstants.detail,
        builder: (context, state) => const DetailScreen(),
      ),
    ],
  );
}
