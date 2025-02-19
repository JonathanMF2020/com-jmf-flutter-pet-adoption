import 'package:flutter/material.dart';
import 'package:petadoption/core/constants/route_constants.dart';
import 'package:petadoption/features/dashboard/data/models/pet/pet_model.dart';
import 'package:petadoption/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:petadoption/features/dashboard/presentation/pages/pet_info_page.dart';
import 'package:petadoption/features/home/presentation/pages/home_pages.dart';
import 'package:petadoption/features/login/presentation/pages/login_page.dart';
import 'package:petadoption/features/register/presentation/pages/register_page.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case routeSignUp:
        return _materialRoute(const RegisterPage());
      case routeLogin:
        return _materialRoute(const LoginPage());
      case routePetInfo:
        final pet = settings.arguments as PetModel?;
        return _materialRoute(PetInfoPage(petModel: pet!));
      case routeDashboard:
        return _materialRoute(const DashboardPage());

      default:
        //return _materialRoute(const MoviesHome());
        return _materialRoute(const HomePage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
