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

Model cubo = Model(
    "Cubo de Madeira",
    "https://threedart.github.io/three.dart/example/web_gl_geometry_cube/web_gl_geometry_cube.html",
    "Cubo de madeira texturizado",
    "assets/images/cube.png",
    "miguel",
    comments_1,
    <Tag>[Tag("free")]);

Model cavalo = Model(
    "Cavalo Legal",
    "https://threedart.github.io/three.dart/example/web_gl_morph_targets_horse/web_gl_morph_targets_horse.html",
    "Cavalo low poly sem textura",
    "assets/images/horse.png",
    "gabriel",
    comments_2,
    <Tag>[Tag("poly"), Tag("Animated")]);

Model psicodelico = Model(
    "Cubos Psicodelicos",
    "https://threedart.github.io/three.dart/example/canvas_interactive_cubes/canvas_interactive_cubes.html",
    "Cubos coloridos transparentes e clicáveis",
    "assets/images/psychedelic_cubes.png",
    "eduardo",
    comments_3,
    <Tag>[Tag("Cube"), Tag("Free")]);
