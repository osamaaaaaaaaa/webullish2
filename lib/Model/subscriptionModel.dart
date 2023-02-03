class subscriptionsModel {
  late String token, date, type, freetrial, ispremum;
  subscriptionsModel(
      {required this.date,
      required this.freetrial,
      required this.ispremum,
      required this.token,
      required this.type});
  subscriptionsModel.fromjson(Map<dynamic, dynamic> map) {
    token = map['token'];
    date = map['date'];
    type = map['type'];
    freetrial = map['freetrial'];
    ispremum = map['ispremuim'];
  }
  tojson() {
    return {
      'token': token,
      'date': date,
      'type': type,
      'freetrial': freetrial,
      'ispremuim': ispremum
    };
  }
}
