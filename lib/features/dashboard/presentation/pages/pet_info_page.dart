import 'package:flutter/material.dart';
import 'package:petadoption/config/colors/app_colors.dart';
import 'package:petadoption/features/dashboard/data/models/pet/pet_model.dart';
import 'package:petadoption/features/dashboard/presentation/widgets/pet_info_widget.dart';

class PetInfoPage extends StatefulWidget {
  const PetInfoPage({super.key, required this.petModel});

  final PetModel petModel;

  @override
  State<PetInfoPage> createState() => _PetInfoPageState();
}

class _PetInfoPageState extends State<PetInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: PetInfoWidget(petModel: widget.petModel),
    );
  }
}
