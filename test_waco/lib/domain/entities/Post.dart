class Post {
  int id;
  String title;
  String body;
  String link;
  String user;
  String? userId;

  Post({
    required this.id,
    required this.title,
    required this.body,
    required this.link,
    required this.user,
    required this.userId,
  });

  Post.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        body = json['body'],
        link = json['link'],
        userId = json['userId'],
        user = json['user'];

  Map<String, dynamic> toJson(){
    return {
      'id': this.id,
      'title': this.title,
      'body': this.body,
      'link': this.link,
      'user': this.user,
      'userId': this.userId,
    };
  }
}
