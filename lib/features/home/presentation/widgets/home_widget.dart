import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petadoption/config/colors/app_colors.dart';
import 'package:petadoption/config/theme/app_theme.dart';
import 'package:petadoption/core/constants/route_constants.dart';
import 'package:petadoption/features/home/presentation/bloc/account/account_bloc.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AccountBloc, AccountState>(
      listener: (context, state) {
        if (state is AccountSuccess) {
          if (state.list.isNotEmpty) {
            if (kDebugMode) {
              print("Se encontraron ${state.list.length} variables");
            }
            Navigator.pushNamedAndRemoveUntil(
                context, routeDashboard, (Route<dynamic> route) => false);
          }
        }
      },
      child: SafeArea(
        child: Stack(
          children: [
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Image.asset("assets/images/cat.png"),
                    Center(
                      child: Text(
                        "Welcome to Pet Adoption",
                        style: titleText(),
                      ),
                    )
                  ],
                )),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height / 4,
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: Offset(0, 5), // Sombra hacia abajo
                      ),
                    ],
                    color: AppColors.primary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "They also need your help",
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            style: primaryButton,
                            onPressed: _handleRegister,
                            child: const Text(
                              "Register",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          ElevatedButton(
                            style: primaryButton,
                            onPressed: _handleSignUp,
                            child: const Text(
                              "Login",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  void _handleSignUp() {
    Navigator.pushNamed(context, routeLogin);
  }

  void _handleRegister() {
    Navigator.pushNamed(context, routeSignUp);
  }
}
