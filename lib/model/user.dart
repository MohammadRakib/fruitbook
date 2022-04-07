class User{

  String email;
  String password;
  bool loginStatus;

  User({required this.email,required this.password,required this.loginStatus});

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'loginStatus': loginStatus? 1 : 0,
    };
  }

  @override
  String toString() {
    return 'User{email: $email, password: $password, loginStatus: $loginStatus}';
  }

}
