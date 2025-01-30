import 'package:equatable/equatable.dart';

class ConfigEntity extends Equatable {
  const ConfigEntity({required this.key, required this.value});

  final String key;
  final String value;

  @override
  List<Object?> get props {
    return [key, value];
  }
}
