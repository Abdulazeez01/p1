import 'package:front_end/api_services/api_handler.dart';
import 'package:front_end/models/dashboard_model.dart';
import 'package:front_end/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardRepository {
  final ApiHandler apiHandler;

  DashboardRepository({required this.apiHandler});

  Future<List<DashboardData>> getDashboardData() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      final response = await apiHandler.get(
        AppConstants.dashboardEndpoint,
        headers: {
          'Authorization': 'Bearer ${prefs.getString('token')}',
          'Content-Type': 'application/json',
        },
      );
      print(response.toString());
      final Map<String, dynamic> responseData = response;

      if (responseData['message'] == 'success') {
        final List<dynamic> data = responseData['data'];
        return data.map((json) => DashboardData.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load dashboard data');
      }
    } catch (error) {
      throw Exception(
          'An error occurred while fetching dashboard data: $error');
    }
  }
}
