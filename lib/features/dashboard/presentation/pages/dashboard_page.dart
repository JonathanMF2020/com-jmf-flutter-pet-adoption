import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petadoption/config/colors/app_colors.dart';
import 'package:petadoption/core/widgets/custom_navigation_bar.dart';
import 'package:petadoption/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:petadoption/features/dashboard/presentation/widgets/dashboard_widget.dart';
import 'package:petadoption/injection_container.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboardBloc>(
      create: (context) => sl<DashboardBloc>(),
      child: _listenerAuth(context),
    );
  }

  BlocListener<DashboardBloc, DashboardState> _listenerAuth(
      BuildContext contextBuild) {
    return BlocListener<DashboardBloc, DashboardState>(
      listener: (context, state) {
        if (state is DashboardSuccess) {
          if (kDebugMode) {
            print("Listo");
          }
        }
        if (state is DashboardError) {
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

  Container _buildBody() {
    return Container(
      margin: const EdgeInsets.all(8),
      child: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (_, state) {
          if (state is DashboardError) {
            return const Center(child: Icon(Icons.refresh));
          }
          return const DashboardWidget();
        },
      ),
    );
  }
}
