import 'package:flutter/material.dart';
import 'package:petadoption/config/theme/app_theme.dart';
import 'package:petadoption/core/utils.dart';
import 'package:petadoption/features/dashboard/data/models/tag/tag_model.dart';

Container createTag(TagModel tag) {
  return Container(
    padding: const EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 20),
    alignment: Alignment.center,
    color: hexToColor(tag.color),
    child: Text(
      tag.name,
      style: const TextStyle(color: Colors.white),
    ),
  );
}

Column customLoading() {
  return Column(
    children: [
      Image.asset("assets/gifts/loading.gif"),
      const SizedBox(height: 10.0),
      Text(
        "Loading",
        style: normalBoldText(),
      )
    ],
  );
}
