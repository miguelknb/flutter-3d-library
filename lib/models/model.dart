List<Comment> comments_1 = [
  Comment("endler", "Que legal! Hahahah 😁"),
  Comment("gabriel", "Não faço ideia de como vocês fizeram isso! 🤯"),
  Comment("hater", "Odiei, não está em 4k"),
];

List<Comment> comments_2 = [
  Comment("jonas", "kkk"),
  Comment("lucas", "hahahaha"),
  Comment("sabrina", "Quero um desses!"),
];

List<Comment> comments_3 = [
  Comment("jonas", "kkk"),
  Comment("lucas", "hahahaha"),
  Comment("sabrina", "Quero um desses!"),
];

class Comment {
  final String username;
  final String body;

  Comment(this.username, this.body);
}

class Tag {
  final String name;

  Tag(this.name);
}

class Model {
  final String name;
  final String url;
  final String description;
  final String imagePath;
  String author = '';
  List<Comment> comments = [];
  List<Tag> tags = [];

  Model(this.name, this.url, this.description, this.imagePath, this.author, this.comments, this.tags);

  Model.simple(this.name, this.url, this.description, this.imagePath);
}
