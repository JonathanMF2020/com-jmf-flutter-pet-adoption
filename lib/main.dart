import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:petadoption/config/routes/routes.dart';
import 'package:petadoption/core/bloc/simple_bloc_observer.dart';
import 'package:petadoption/features/home/presentation/pages/home_pages.dart';
import 'package:petadoption/injection_container.dart';

import 'config/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await initializeDependencies();
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      title: 'Pet Adoption',
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      home: const HomePage(),
    );
  }
}
