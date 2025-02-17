import 'package:equatable/equatable.dart';

class PetEntity extends Equatable {
  const PetEntity({required this.id, required this.name, required this.age});

  final int id;
  final String name;
  final int age;

  @override
  List<Object?> get props {
    return [id, name, age];
  }
}
