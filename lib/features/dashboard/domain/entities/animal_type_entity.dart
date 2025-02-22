import 'package:equatable/equatable.dart';

class AnimalTypeEntity extends Equatable {
  const AnimalTypeEntity(
      {required this.id,
      required this.name,
      required this.filename,
      required this.path});

  final int id;
  final String name;
  final String? filename;
  final String? path;

  @override
  List<Object?> get props {
    return [id, name];
  }
}
