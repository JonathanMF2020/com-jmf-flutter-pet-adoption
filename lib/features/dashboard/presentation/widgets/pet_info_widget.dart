import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:petadoption/config/colors/app_colors.dart';
import 'package:petadoption/config/theme/app_theme.dart';
import 'package:petadoption/core/constants/constants.dart';
import 'package:petadoption/features/dashboard/data/models/pet/pet_model.dart';

class PetInfoWidget extends StatefulWidget {
  const PetInfoWidget({super.key, required this.petModel});
  final PetModel petModel;
  @override
  State<PetInfoWidget> createState() => _PetInfoWidgetState();
}

class _PetInfoWidgetState extends State<PetInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 2.0,
                              backgroundColor: AppColors.primary,
                              padding: const EdgeInsets.all(15)),
                          onPressed: () {},
                          child: const Text("Adopt Now",
                              style: TextStyle(color: Colors.white))),
                    ),
                    const SizedBox(width: 10.0),
                    circleButton(onCall, Colors.blue.shade100, Colors.blue,
                        Icons.phone_outlined),
                    const SizedBox(width: 10.0),
                    circleButton(onCall, Colors.orange.shade100, Colors.orange,
                        Icons.message_outlined)
                  ],
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                    tag: widget.petModel.id,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: CachedNetworkImage(
                        imageUrl: apiImagesURL + widget.petModel.filename!,
                        height: 300,
                        width: MediaQuery.of(context).size.width - 16,
                        fit: BoxFit.cover,
                      ),
                    )),
                const SizedBox(height: 20.0),
                Text(
                  widget.petModel.name,
                  style: titleText(),
                ),
                const SizedBox(height: 10.0),
                Wrap(
                  children: [
                    const Icon(
                      Icons.place,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 10.0),
                    Text(
                      "Leon Guanajuato",
                      style: subtitleTextGrey(),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.center,
                  children: [
                    createCat("Gender", "Female", AppColors.ageContainer),
                    createCat("Age", "${widget.petModel.age} Years",
                        AppColors.weightContainer),
                    createCat("Gender", "2 LBS", AppColors.genderContainer),
                  ],
                ),
                const SizedBox(height: 20.0),
                Text(
                  "Description",
                  style: subtitleText(),
                ),
                Text(
                  widget.petModel.description,
                  style: normalText(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector circleButton(
      GestureTapCallback function, Color color1, Color color2, IconData icon) {
    return GestureDetector(
      onTap: function,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color1,
            border: Border.all(color: color2)),
        child: Icon(icon),
      ),
    );
  }

  Container createCat(String value, String value2, Color color) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      width: MediaQuery.of(context).size.width / 3 - 19,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(16)),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: subtitleTextGrey2(),
          ),
          Text(
            value2,
            style: normalBoldText2(),
          )
        ],
      ),
    );
  }

  void onCall() {}
}
