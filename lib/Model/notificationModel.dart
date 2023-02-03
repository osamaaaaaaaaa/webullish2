// ignore_for_file: camel_case_types

class notificationModel {
  late String title, senttime, image, body;

  notificationModel(
      {required this.senttime,
      required this.title,
      required this.body,
      required this.image});
  notificationModel.fromjson(Map<dynamic, dynamic> map) {
    title = map['title'];
    senttime = map['senttime'];
    image = map['image'];
    body = map['body'];
  }

  tojson() {
    return {
      'title': title,
      'senttime': senttime,
      'image': image,
      'body': body,
    };
  }
}
