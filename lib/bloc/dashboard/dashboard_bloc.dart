import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end/repository/dashboard_repository.dart';
import 'dashboard_event.dart';
import 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final DashboardRepository dashboardRepository;

  DashboardBloc({required this.dashboardRepository})
      : super(DashboardInitial()) {
    on<DashboardFetched>(_onDashboardFetched);
  }

  Future<void> _onDashboardFetched(
      DashboardFetched event, Emitter<DashboardState> emit) async {
    emit(DashboardLoading());
    try {
      final data = await dashboardRepository.getDashboardData();
      emit(DashboardLoaded(dashboardData: data));
    } catch (e) {
      emit(DashboardError(error: e.toString()));
    }
  }
}
