import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petadoption/config/colors/app_colors.dart';
import 'package:petadoption/core/constants/route_constants.dart';
import 'package:petadoption/features/login/presentation/bloc/login_bloc.dart';
import 'package:petadoption/features/login/presentation/widget/login_widget.dart';
import 'package:petadoption/injection_container.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => sl<LoginBloc>(),
      child: _listenerAuth(context),
    );
  }

  BlocListener<LoginBloc, LoginState> _listenerAuth(BuildContext contextBuild) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.pushNamedAndRemoveUntil(
              context, routeDashboard, (Route<dynamic> route) => false);
        }
        if (state is LoginError) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Ha ocurrido un error")),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: _buildBody(),
      ),
    );
  }

  Container _buildBody() {
    return Container(
      margin: const EdgeInsets.all(8),
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (_, state) {
          if (state is LoginError) {
            return const Center(child: Icon(Icons.refresh));
          }
          return const LoginWidget();
        },
      ),
    );
  }
}
