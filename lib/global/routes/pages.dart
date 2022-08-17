import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_practice/presentation/pages/new_memo/new_memo.dart';
import 'package:riverpod_practice/presentation/pages/pages.dart';

part './routes.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier(ref);

  return GoRouter(
    debugLogDiagnostics: false,
    refreshListenable: router,
    routes: router.routes,
  );
});

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref);

  List<GoRoute> get routes => [
        GoRoute(
          name: RouteList.home.name,
          path: RouteList.home.path,
          builder: (context, _) => const Home(),
        ),
        GoRoute(
            name: RouteList.new_page.name,
            path: RouteList.new_page.path,
            builder: (context, _) => const NewMemo()),
      ];
}
