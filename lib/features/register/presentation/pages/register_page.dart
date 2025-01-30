import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petadoption/config/colors/app_colors.dart';
import 'package:petadoption/features/register/presentation/bloc/register_bloc.dart';
import 'package:petadoption/features/register/presentation/widget/register_widget.dart';
import 'package:petadoption/injection_container.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterBloc>(
      create: (context) => sl<RegisterBloc>(),
      child: _listenerAuth(context),
    );
  }

  BlocListener<RegisterBloc, RegisterState> _listenerAuth(
      BuildContext contextBuild) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          if (kDebugMode) {
            print("Listo");
          }
        }
        if (state is RegisterError) {
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
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (_, state) {
          if (state is RegisterError) {
            return const Center(child: Icon(Icons.refresh));
          }
          return const RegisterWidget();
        },
      ),
    );
  }
}
