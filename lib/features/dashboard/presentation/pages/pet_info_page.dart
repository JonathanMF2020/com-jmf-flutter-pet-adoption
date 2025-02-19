import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:petadoption/config/colors/app_colors.dart';
import 'package:petadoption/config/theme/app_theme.dart';
import 'package:petadoption/core/constants/constants.dart';
import 'package:petadoption/core/widgets/custom_navigation_bar.dart';
import 'package:petadoption/core/widgets/util_widgets.dart';
import 'package:petadoption/features/dashboard/data/models/pet/pet_model.dart';

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
      bottomNavigationBar: customNavigationBar(0),
      body: SafeArea(
        child: ListView(
          children: [
            Hero(
                tag: widget.petModel.id,
                child: CachedNetworkImage(
                  imageUrl: apiImagesURL + widget.petModel.filename!,
                  height: 200,
                )),
            Container(
              margin: const EdgeInsets.all(16),
              child: Column(
                children: [
                  widget.petModel.tags.isNotEmpty
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: widget.petModel.tags
                              .map((tag) => createTag(tag))
                              .toList())
                      : Container(),
                  const SizedBox(height: 10.0),
                  Text(
                    widget.petModel.name,
                    style: titleText(),
                  ),
                  Text(
                    widget.petModel.description,
                    style: normalText(),
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Age: ${widget.petModel.age} years",
                        style: normalBoldText(),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "Animal Type: ${widget.petModel.animal_type!.name}t",
                        style: normalBoldText(),
                        textAlign: TextAlign.start,
                      )
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Align(
                    child: Text(
                      "Breed: ${widget.petModel.breed!.name}",
                      style: normalBoldText(),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: AppColors.accent,
                    child: Column(
                      children: [
                        const Icon(
                          Icons.pets,
                          size: 60,
                          color: Colors.white,
                        ),
                        Text(
                          "Adopt me",
                          style: normalBoldWhiteText(),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
