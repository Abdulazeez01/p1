import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end/api_services/api_handler.dart';
import 'package:front_end/api_services/api_provider.dart';
import 'package:front_end/bloc/dashboard/dashboard_bloc.dart';
import 'package:front_end/bloc/dashboard/dashboard_event.dart';
import 'package:front_end/bloc/dashboard/dashboard_state.dart';
import 'package:front_end/repository/dashboard_repository.dart';
import 'package:go_router/go_router.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: BlocProvider(
        create: (context) => DashboardBloc(
            dashboardRepository: DashboardRepository(
                apiHandler: ApiHandler(apiProvider: ApiProvider())))
          ..add(DashboardFetched()),
        child: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) {
            if (state is DashboardLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is DashboardLoaded) {
              return ListView.builder(
                itemCount: state.dashboardData.length,
                itemBuilder: (context, index) {
                  final data = state.dashboardData[index];
                  return GestureDetector(
                    onTap: () {
                      context.go('/home');
                    },
                    child: ListTile(
                      title: Text(data.title),
                      subtitle: Text(data.description),
                    ),
                  );
                },
              );
            } else if (state is DashboardError) {
              return Center(child: Text('Error: ${state.error}'));
            } else {
              return const Center(child: Text('No data available.'));
            }
          },
        ),
      ),
    );
  }
}
