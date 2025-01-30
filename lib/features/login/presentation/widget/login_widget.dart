import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petadoption/config/theme/app_theme.dart';
import 'package:petadoption/core/constants/route_constants.dart';
import 'package:petadoption/features/login/data/models/dto/login_dto.dart';
import 'package:petadoption/features/login/presentation/bloc/login_bloc.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController _password = TextEditingController();
  final TextEditingController _username = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Text(
            "Pet Adoption",
            style: titleText(),
            textAlign: TextAlign.center,
          ),
          Image.asset(
            "assets/images/register-image.png",
            height: 200,
          ),
          Container(
            margin: const EdgeInsets.only(top: 12, left: 8, right: 8),
            child: Column(
              children: [
                Text(
                  "Login",
                  style: subtitleText(),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: _username,
                  decoration: customInputDecoration(
                    hintText: "Enter your username",
                    labelText: "Username",
                    prefixIcon: const Icon(Icons.person),
                  ),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: _password,
                  decoration: customInputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: const Icon(
                        Icons.visibility_off), // Icon to show/hide password
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
                const SizedBox(height: 30.0),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (_, state) {
                    if (state is LoginLoadingService) {
                      return const CircularProgressIndicator();
                    }
                    return ElevatedButton(
                      style: primaryButton,
                      onPressed: _handleLogin,
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
                Text("Don't have an account?", style: normalText()),
                GestureDetector(
                    onTap: _handleCeretaAc,
                    child: Text("Sign Up", style: normalColorUnderLineText())),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _handleLogin() {
    if (_password.text.isNotEmpty && _username.text.isNotEmpty) {
      BlocProvider.of<LoginBloc>(context).add(ClickButtonLoginService(
          LoginDto(password: _password.text, username: _username.text)));
    }
  }

  void _handleCeretaAc() {
    Navigator.pushNamedAndRemoveUntil(
        context, routeSignUp, (Route<dynamic> route) => false);
  }
}
