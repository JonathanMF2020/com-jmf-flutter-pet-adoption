import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petadoption/config/theme/app_theme.dart';
import 'package:petadoption/core/constants/constants.dart';
import 'package:petadoption/core/constants/route_constants.dart';
import 'package:petadoption/core/widgets/util_widgets.dart';
import 'package:petadoption/features/dashboard/data/models/pet/pet_model.dart';
import 'package:petadoption/features/dashboard/presentation/bloc/pet/pet_bloc.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({super.key});

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<PetBloc, PetState>(
      listener: (context, state) {
        if (state is PetError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
          if (state.type == 1) {
            Navigator.pushNamedAndRemoveUntil(
                context, routeHome, (Route<dynamic> route) => false);
          }
        }
      },
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<PetBloc, PetState>(
                builder: (context, state) {
                  if (state is PetSuccess) {
                    return PageView(
                      scrollDirection: Axis.vertical,
                      physics: const ClampingScrollPhysics(),
                      children: state.petModels
                          .map((item) => petConainer(item))
                          .toList(),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container petConainer(PetModel model) {
    return Container(
      margin: const EdgeInsets.only(left: 8, right: 8),
      child: Column(
        children: [
          Text(
            model.name,
            style: titleText(),
          ),
          Container(
              margin: const EdgeInsets.only(left: 8, right: 8),
              child: model.filename == null
                  ? const CircularProgressIndicator()
                  : Hero(
                      tag: model.id,
                      child: CachedNetworkImage(
                        imageUrl: apiImagesURL + model.filename!,
                        height: 200,
                        width: MediaQuery.of(context).size.width - 16,
                      ),
                    )),
          model.tags.isNotEmpty ? const SizedBox(height: 30.0) : Container(),
          model.tags.isNotEmpty
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: model.tags.map((tag) => createTag(tag)).toList())
              : Container(),
          const SizedBox(height: 30.0),
          Card(
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Description: ",
                      style: subtitleText(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      model.description,
                      style: normalText(),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 - 20,
                        child: Text(
                          "Age: ${model.age} years",
                          style: normalBoldText(),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 - 20,
                        child: Text(
                          "Animal Type: ${model.animal_type!.name}t",
                          style: normalBoldText(),
                          textAlign: TextAlign.start,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 16,
                    child: Text(
                      "Breed: ${model.breed!.name}",
                      style: normalBoldText(),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30.0),
          IconButton(
              onPressed: () => navigateToPet(model),
              icon: const Icon(
                Icons.arrow_forward_ios,
                size: 40,
              ))
        ],
      ),
    );
  }

  void navigateToPet(PetModel petmodel) {
    Navigator.pushNamed(context, routePetInfo, arguments: petmodel);
  }
}
