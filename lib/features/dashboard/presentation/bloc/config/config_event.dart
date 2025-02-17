part of 'config_bloc.dart';

@immutable
abstract class ConfigEvent {}

// ignore: must_be_immutable
class LoadConfig extends ConfigEvent {
  LoadConfig();
}
