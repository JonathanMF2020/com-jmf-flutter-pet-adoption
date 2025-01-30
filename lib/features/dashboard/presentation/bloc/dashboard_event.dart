part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardEvent {}

// ignore: must_be_immutable
class LoadDashboard extends DashboardEvent {
  LoadDashboard();
}
