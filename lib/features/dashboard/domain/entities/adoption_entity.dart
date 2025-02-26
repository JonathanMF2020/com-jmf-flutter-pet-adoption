// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class AdoptionEntity extends Equatable {
  const AdoptionEntity(
      {required this.id, required this.city, required this.zip_code});

  final int id;
  final String city;
  final String zip_code;

  @override
  List<Object?> get props {
    return [id, city, zip_code];
  }
}
