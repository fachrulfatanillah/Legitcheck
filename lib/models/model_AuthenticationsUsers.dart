class Authentication {
  final String id;
  final String user_id;
  final String otp;
  final String date_created_at;
  final String time_created_at;
  final String date_expired_at;
  final String time_expired_at;
  final String status;

  Authentication({
    required this.id,
    required this.user_id,
    required this.otp,
    required this.date_created_at,
    required this.time_created_at,
    required this.date_expired_at,
    required this.time_expired_at,
    required this.status,
  });

  factory Authentication.fromJson(Map<String, dynamic> json) {
    return Authentication(
      id: json['id'],
      user_id: json['user_id'],
      otp: json['otp'],
      date_created_at: json['date_created_at'],
      time_created_at: json['time_created_at'],
      date_expired_at: json['date_expired_at'],
      time_expired_at: json['time_expired_at'],
      status: json['status'],
    );
  }
}
