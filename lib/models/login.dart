class Login {
  final String username;
  final String password;

  const Login({
    required this.username,
    required this.password,
  });

  // ✅ Convert object to Map
  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
    };
  }

  // ✅ Convert Map to Object
  factory Login.fromMap(Map<String, dynamic> map) {
    return Login(
      username: map['username'] ?? '',
      password: map['password'] ?? '',
    );
  }

  // ✅ CopyWith giúp tạo object mới với một số giá trị thay đổi
  Login copyWith({String? username, String? password}) {
    return Login(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  // ✅ Override == và hashCode để so sánh object
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Login && other.username == username && other.password == password;
  }

  @override
  int get hashCode => username.hashCode ^ password.hashCode;

  // ✅ toString để debug
  @override
  String toString() => 'Login(username: $username, password: $password)';
}
