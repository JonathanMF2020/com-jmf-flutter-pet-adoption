import 'package:equatable/equatable.dart';

class BreedEntity extends Equatable {
  const BreedEntity({required this.id, required this.name});

  final int id;
  final String name;

  @override
  List<Object?> get props {
    return [id, name];
  }
}
