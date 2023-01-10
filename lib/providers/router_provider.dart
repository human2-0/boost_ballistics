
import 'dart:async';

import 'package:boost_ballistics/providers/auth_provider.dart';
import 'package:boost_ballistics/providers/states/login_controller.dart';
import 'package:boost_ballistics/providers/states/login_states.dart';
import 'package:boost_ballistics/ui/expanding_fab/pressing/pressing_form.dart';
import 'package:boost_ballistics/ui/home_screen.dart';
import 'package:boost_ballistics/ui/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:boost_ballistics/ui/expanding_fab/pressing/pressing.dart';



final routerProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier(ref);
  return GoRouter(
      debugLogDiagnostics: true,
      initialLocation: '/login',
      routes: router._routes,
      redirect: router._redirect,
  );
});

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    _ref.listen<LoginState>(
      loginControllerProvider,
          (_, __) => notifyListeners(),
    );
  }

  List<GoRoute> get _routes =>
      [
        GoRoute(
          name: 'login',
          builder: (context, state) => const LoginScreen(),
          path: '/login',
        ),
        GoRoute(
          name: 'home',
          builder: (context, state) => const HomeScreen(),
          path: '/',
        ),
        GoRoute(
          name: 'splash',
          builder: (context, state) => const SplashScreen(),
          path: '/loading',
        ),
        GoRoute(
          name: 'pressing',
          builder: (context, state) => const Pressing(),
          path: '/pressing',
        ),
        GoRoute(
          name: 'pressing_form',
          builder: (context, state) => const PressingForm(),
          path: '/pressing/form',
        ),
      ];

  FutureOr<String?> _redirect(BuildContext context, GoRouterState state) {
    final loginState = _ref.watch(loginControllerProvider);
    final whereAm = state.location == '/login';
    if ((loginState is LoginStateLoading) & whereAm ) {return '/loading';}
    if ((loginState is LoginStateSuccess) & whereAm ) {return '/';}
    if ((loginState is LoginStateInitial) & !whereAm ) {return '/login';}
    return null;
  }
}
