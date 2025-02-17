import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petadoption/config/colors/app_colors.dart';
import 'package:petadoption/features/home/presentation/bloc/account/account_bloc.dart';
import 'package:petadoption/features/home/presentation/widgets/home_widget.dart';
import 'package:petadoption/injection_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocProvider<AccountBloc>(
        create: (context) => sl<AccountBloc>()..add(CheckAccountEvent()),
        child: _buildBody(),
      ),
    );
  }

  HomeWidget _buildBody() {
    return const HomeWidget();
  }
}
