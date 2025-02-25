import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petadoption/config/theme/app_theme.dart';
import 'package:petadoption/core/constants/route_constants.dart';
import 'package:petadoption/core/widgets/util_widgets.dart';
import 'package:petadoption/features/register/data/models/dto/register_dto.dart';
import 'package:petadoption/features/register/presentation/bloc/register_bloc.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  var showPassword = true;
  final TextEditingController _email = TextEditingController();
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
                  "Register",
                  style: subtitleText(),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: _email,
                  decoration: customInputDecoration(
                    hintText: "Enter your email address",
                    labelText: "Email",
                    prefixIcon: const Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20.0),
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
                    suffixIcon: IconButton(
                        onPressed: _onClickEye,
                        icon: !showPassword
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons
                                .visibility_off)), // Icon to show/hide password
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: showPassword,
                ),
                const SizedBox(height: 30.0),
                BlocBuilder<RegisterBloc, RegisterState>(
                  builder: (_, state) {
                    if (state is RegisterLoadingService) {
                      return customLoading();
                    }
                    return ElevatedButton(
                      style: primaryButton,
                      onPressed: _handleRegister,
                      child: const Text(
                        "Register",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
                Text("Already have an account?", style: normalText()),
                GestureDetector(
                    onTap: _handleSignUp,
                    child: Text("Login", style: normalColorUnderLineText())),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _handleRegister() {
    if (_email.text.isNotEmpty &&
        _password.text.isNotEmpty &&
        _username.text.isNotEmpty) {
      BlocProvider.of<RegisterBloc>(context).add(RegisterLoginService(
          RegisterDto(
              email: _email.text,
              password: _password.text,
              username: _username.text)));
    }
  }

  void _onClickEye() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  void _handleSignUp() {
    Navigator.pushNamedAndRemoveUntil(
        context, routeLogin, (Route<dynamic> route) => false);
  }
}
