import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petadoption/config/colors/app_colors.dart';
import 'package:petadoption/core/widgets/custom_navigation_bar.dart';
import 'package:petadoption/features/dashboard/presentation/bloc/config/config_bloc.dart';
import 'package:petadoption/features/dashboard/presentation/bloc/pet/pet_bloc.dart';
import 'package:petadoption/features/dashboard/presentation/widgets/dashboard_widget.dart';
import 'package:petadoption/injection_container.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ConfigBloc>(
          create: (context) => sl<ConfigBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<PetBloc>()..add(GetPetsEvent()),
        ),
      ],
      child: _listenerAuth(context),
    );
  }

  BlocListener<ConfigBloc, ConfigState> _listenerAuth(
      BuildContext contextBuild) {
    return BlocListener<ConfigBloc, ConfigState>(
      listener: (context, state) {
        if (state is ConfigSuccess) {
          if (kDebugMode) {
            print("Listo");
          }
        }
        if (state is ConfigError) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Ha ocurrido un error")),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: _buildBody(),
        bottomNavigationBar: customNavigationBar(0),
      ),
    );
  }

  BlocBuilder _buildBody() {
    return BlocBuilder<ConfigBloc, ConfigState>(
      builder: (_, state) {
        if (state is ConfigError) {
          return const Center(child: Icon(Icons.refresh));
        }
        return const DashboardWidget();
      },
    );
  }
}
