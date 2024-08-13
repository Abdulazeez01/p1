import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end/api_services/api_handler.dart';
import 'package:front_end/api_services/api_provider.dart';
import 'package:front_end/bloc/authentication/authentication_bloc.dart';
import 'package:front_end/bloc/dashboard/dashboard_bloc.dart';
import 'package:front_end/repository/dashboard_repository.dart';
import 'package:front_end/repository/user_repository.dart';
import 'package:front_end/routes/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(
              userRepository: UserRepository(
                  apiHandler: ApiHandler(apiProvider: ApiProvider()))),
        ),
        BlocProvider(
            create: (context) => DashboardBloc(
                dashboardRepository: DashboardRepository(
                    apiHandler: ApiHandler(apiProvider: ApiProvider()))))
        // Add other BLoCs here
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter().router,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
