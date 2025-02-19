import 'package:equatable/equatable.dart';

class AnimalTypeEntity extends Equatable {
  const AnimalTypeEntity({required this.id, required this.name});

  final int id;
  final String name;

  @override
  List<Object?> get props {
    return [id, name];
  }
}
