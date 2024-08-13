class DashboardData {
  final int id;
  final String title;
  final String description;
  final DateTime date;

  DashboardData({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
  });

  factory DashboardData.fromJson(Map<String, dynamic> json) {
    return DashboardData(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      date: DateTime.parse(json['date']),
    );
  }
}
