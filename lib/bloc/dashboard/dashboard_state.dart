import 'package:equatable/equatable.dart';
import 'package:front_end/models/dashboard_model.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final List<DashboardData> dashboardData;

  const DashboardLoaded({required this.dashboardData});

  @override
  List<Object> get props => [dashboardData];
}

class DashboardError extends DashboardState {
  final String error;

  const DashboardError({required this.error});

  @override
  List<Object> get props => [error];
}
