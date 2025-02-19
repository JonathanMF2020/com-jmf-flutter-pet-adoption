import 'package:equatable/equatable.dart';

class TagEntity extends Equatable {
  const TagEntity({required this.id, required this.name, required this.color});

  final int id;
  final String name;
  final String color;

  @override
  List<Object?> get props {
    return [id, name, color];
  }
}
