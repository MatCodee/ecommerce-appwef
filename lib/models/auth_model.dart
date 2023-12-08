

class SignUpBody {
  String username;
  String phone;
  String email;
  String password;
  
  SignUpBody({
    required this.username,
    required this.phone,
    required this.email,
    required this.password
  });

  Map<String, dynamic> toJson() {
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data['username'] = this.username;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}

