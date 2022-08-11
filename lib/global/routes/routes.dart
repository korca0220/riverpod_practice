part of './pages.dart';

class Route {
  Route({
    required this.name,
    required this.path,
  });
  final String name;
  final String path;
}

abstract class RouteList {
  static final home = Route(name: 'home', path: '/');
}
