part of 'config_bloc.dart';

@immutable
abstract class ConfigState {}

class ConfigInit extends ConfigState {}

class ConfigLoading extends ConfigState {}

class ConfigLoadingService extends ConfigState {}

class ConfigSuccess extends ConfigState {
  final List<ConfigModel> configModel;
  ConfigSuccess(this.configModel);
}

class ConfigError extends ConfigState {
  final String error;
  ConfigError(this.error);
}
