import 'package:flutter/material.dart';
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
