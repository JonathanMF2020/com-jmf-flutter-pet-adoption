import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petadoption/config/theme/app_theme.dart';
import 'package:petadoption/features/dashboard/data/models/pet_model.dart';
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
                          .map((item) => Text(item.name))
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
              child: Image.asset("assets/images/conejo.jpg")),
          const SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              createTag("Alegre"),
              createTag("Energico"),
              //createTag("Alegre"),
              //createTag("Alegre")
            ],
          ),
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
                  Text(
                    "El conejo es un mamífero herbívoro de la especie Oryctolagus cuniculus. Se caracteriza por tener un pelaje espeso, orejas largas, patas traseras fuertes y una cola cort",
                    style: normalText(),
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 - 20,
                        child: Text(
                          "Age: 2 years",
                          style: normalBoldText(),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 - 20,
                        child: Text(
                          "Animal Type: Rabbit",
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
                      "Breed: Narna",
                      style: normalBoldText(),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container createTag(String tag) {
    return Container(
      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 20),
      alignment: Alignment.center,
      color: Colors.blue,
      child: Text(
        tag,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
