class Teacher {
  final int code;
  final String password;

  Teacher({
    required this.code,
    required this.password
  });

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'password': password
    };
  }
}
