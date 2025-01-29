import 'package:flutter/material.dart';
import 'package:petadoption/features/home/presentation/pages/home_pages.dart';
import 'package:petadoption/features/login/presentation/pages/login_page.dart';
import 'package:petadoption/features/register/presentation/pages/register_page.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/signup':
        return _materialRoute(const RegisterPage());
      case '/login':
        return _materialRoute(const LoginPage());

      default:
        //return _materialRoute(const MoviesHome());
        return _materialRoute(HomePage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
