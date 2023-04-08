
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterboilerplate/feature/presentation/pages/home/home.dart';

import '../../presentation/pages/login/login.dart';


class RouteGenrator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    print(settings.name);
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
      case '/ticketdetails':
        final args = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => Container()
        );
      case '/homepage':
        return MaterialPageRoute(
          builder: (context) => const Homepage(),
        );
      default:
        return _errorPage();
    }
  }

  static Route _errorPage() {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(title: const Text("Error")),
          body: const Center(child: Text("Error")),
        );
      },
    );
  }
}
