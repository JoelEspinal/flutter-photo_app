class ImageModel {
  late int id;
  late String body;
  late String title;

  ImageModel(this.id, this.body, this.title);

  ImageModel.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    body = parsedJson['body'];
    title = parsedJson['title'];
  }
}
