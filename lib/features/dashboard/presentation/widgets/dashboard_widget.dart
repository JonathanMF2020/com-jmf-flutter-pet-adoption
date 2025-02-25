import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petadoption/config/flavors/app_config.dart';
import 'package:petadoption/config/theme/app_theme.dart';
import 'package:petadoption/core/constants/route_constants.dart';
import 'package:petadoption/core/widgets/util_widgets.dart';
import 'package:petadoption/features/dashboard/data/models/animal_type/animal_type_model.dart';
import 'package:petadoption/features/dashboard/data/models/pet/pet_model.dart';
import 'package:petadoption/features/dashboard/presentation/bloc/animal_type/animal_type_bloc.dart';
import 'package:petadoption/features/dashboard/presentation/bloc/pet/pet_bloc.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({super.key});

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {}); // Forzar reconstrucción después del primer frame
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<PetBloc, PetState>(
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
        ),
        BlocListener<AnimalTypeBloc, AnimalTypeState>(
          listener: (context, state) {
            if (state is AnimalTypeError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                ),
              );
            }
          },
        ),
      ],
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            children: [
              const CupertinoSearchTextField(
                prefixIcon: Icon(Icons.search),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: subtitleText(),
                  ),
                  Text(
                    "See more",
                    style: normalText(),
                  ),
                ],
              ),
              BlocBuilder<AnimalTypeBloc, AnimalTypeState>(
                builder: (context, state) {
                  if (state is AnimalTypeSuccess) {
                    return Flexible(
                      flex: 1,
                      child: ListView.separated(
                        itemCount: state.animalTypes.length,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 10,
                        ),
                        itemBuilder: (context, index) =>
                            animalTypeContainer(state.animalTypes[index]),
                      ),
                    );
                  }
                  return customLoading();
                },
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Trending Pets",
                    style: subtitleText(),
                  ),
                  Text(
                    "See more",
                    style: normalText(),
                  ),
                ],
              ),
              BlocBuilder<PetBloc, PetState>(
                builder: (context, state) {
                  if (state is PetSuccess) {
                    return Flexible(
                      flex: 5,
                      child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: state.petModels
                              .map((pet) => pet.filename != null
                                  ? petContainer(pet)
                                  : Container())
                              .toList()),
                    );
                  }
                  return Container();
                },
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: subtitleText(),
                  ),
                  Text(
                    "See more",
                    style: normalText(),
                  ),
                ],
              ),
              BlocBuilder<PetBloc, PetState>(
                builder: (context, state) {
                  if (state is PetSuccess) {
                    return Flexible(
                      flex: 5,
                      child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: state.petModels
                              .map((pet) => pet.filename != null
                                  ? petContainerNon(pet)
                                  : Container())
                              .toList()),
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  ClipRRect animalTypeContainer(AnimalTypeModel animalType) {
    if (animalType.path == null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            animalType.name,
            style: normalBoldText(),
          ),
        ),
      );
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CachedNetworkImage(
              imageUrl: AppConfig.shared.apiBaseURL + animalType.path!,
              fit: BoxFit.fill),
          Align(
              alignment: Alignment.center,
              child: Text(
                animalType.name,
                style: miniTextCategory(),
              )),
        ],
      ),
    );
  }

  GestureDetector petContainerNon(PetModel pet) {
    return GestureDetector(
      onTap: () => navigateToPet(pet),
      child: Card(
        borderOnForeground: true,
        child: Container(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            children: [
              Flexible(
                flex: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: CachedNetworkImage(
                    imageUrl: AppConfig.shared.apiBaseURL + pet.path!,
                    fit: BoxFit.cover,
                    width: 120,
                    height: 120,
                  ),
                ),
              ),
              const SizedBox(height: 5.0),
              Flexible(
                flex: 3,
                child: Column(
                  children: [
                    Text(
                      pet.name,
                      style: normalBoldText(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.location_city),
                        SizedBox(
                          width: 90,
                          child: Text(
                            "Leon, Guanajuato",
                            style: normalTextMinum(),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.timelapse),
                        SizedBox(
                          width: 90,
                          child: Text(
                            "${pet.age.toString()} year old",
                            style: normalTextMinum(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector petContainer(PetModel pet) {
    return GestureDetector(
      onTap: () => navigateToPet(pet),
      child: Card(
        borderOnForeground: true,
        child: Container(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            children: [
              Flexible(
                flex: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Hero(
                    tag: pet.id,
                    child: CachedNetworkImage(
                      imageUrl: AppConfig.shared.apiBaseURL + pet.path!,
                      fit: BoxFit.cover,
                      width: 120,
                      height: 120,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5.0),
              Flexible(
                flex: 3,
                child: Column(
                  children: [
                    Text(
                      pet.name,
                      style: normalBoldText(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.location_city),
                        SizedBox(
                          width: 90,
                          child: Text(
                            "Leon, Guanajuato",
                            style: normalTextMinum(),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.timelapse),
                        SizedBox(
                          width: 90,
                          child: Text(
                            "${pet.age.toString()} year old",
                            style: normalTextMinum(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void navigateToPet(PetModel petmodel) {
    Navigator.pushNamed(context, routePetInfo, arguments: petmodel);
  }
}
