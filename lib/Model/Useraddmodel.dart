class Usermodel {
  String? username;
  String? email;
  String? password;

  Usermodel({this.username, this.email, this.password});

  Usermodel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;

    data['email'] = this.email;
    data['completed'] = this.password;
    return data;
  }
}

