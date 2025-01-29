import 'package:flutter/material.dart';
import 'package:petadoption/config/colors/app_colors.dart';
import 'package:petadoption/features/home/presentation/widgets/home_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: _buildBody(),
    );
  }

  Container _buildBody() {
    return Container(
      child: HomeWidget(),
    );
  }
}
