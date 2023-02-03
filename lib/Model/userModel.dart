class userModel {
  late String name, email, password, country, mobile;
  userModel(
      {required this.country,
      required this.email,
      required this.name,
      required this.mobile,
      required this.password});
  userModel.fromjson(Map<dynamic, dynamic> map) {
    name = map['name'];
    email = map['email'];
    password = map['password'];
    country = map['country'];
    mobile = map['mobile'];
  }
  tojson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'country': country,
      'mobile': mobile
    };
  }
}
