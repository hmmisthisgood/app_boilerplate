import 'package:flutter/widgets.dart';

class Nav {
  static GlobalKey _navKey = GlobalKey<NavigatorState>();

  static get navKey => _navKey;

  static BuildContext? _context = _navKey.currentContext;

  static get context => _context;

  static void pushNamed(String route) {
    Navigator.of(_context!).pushNamed(route);
  }

  static void pushReplacementNamed(String route) {
    Navigator.of(_context!).pushNamed(route);
  }

  static void pop() {
    Navigator.of(_context!).pop();
  }
}
