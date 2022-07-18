
class LoginUser {
  String? id;
  String? name;
  String? user;
  String? pass;
  String? mobile;
  String? method;

  LoginUser({this.id, this.name, this.user, this.pass, this.mobile,this.method});

  LoginUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    user = json['user'];
    pass = json['pass'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJsonLogin() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    data['pass'] = this.pass;
    data['method'] = "login";
    return data;
  }
  Map<String, dynamic> toJsonsignUp() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    data['pass'] = this.pass;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['method'] = "signup";
    return data;
  }
}