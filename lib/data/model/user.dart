class User {
  final String name;
  final String username;
  final String email;
  final String phoneNo;
  final double allTimeEarned;
  final double weeklyEarned;
  final double dailyEarned;
  bool? isUp;

  User({
    required this.name,
    required this.username,
    required this.email,
    required this.phoneNo,
    this.allTimeEarned = 0,
    this.weeklyEarned = 0,
    this.dailyEarned = 0,
    this.isUp,
  });

  @override
  String toString() => "Name: $name";
}
