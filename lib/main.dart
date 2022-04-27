import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

List<Comment> comments = [
  Comment("endler", "Que legal! Hahahah 😁"),
  Comment("gabriel", "Não faço ideia de como vocês fizeram isso! 🤯"),
  Comment("hater", "Odiei, não está em 4k"),
];

void main() {
  print(comments.length);
  runApp(App());
}

class Comment {
  String username;
  String body;

  Comment(this.username, this.body);
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(),
            body: WebView(
              gestureNavigationEnabled: true,
              initialUrl:
                  'https://threedart.github.io/three.dart/example/web_gl_geometry_cube/web_gl_geometry_cube.html',
              javascriptMode: JavascriptMode.unrestricted,
            )));
  }
}
