part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardState {}

class DashboardInit extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoadingService extends DashboardState {}

class DashboardSuccess extends DashboardState {
  final List<ConfigModel> configModel;
  DashboardSuccess(this.configModel);
}

class DashboardError extends DashboardState {
  final String error;
  DashboardError(this.error);
}
