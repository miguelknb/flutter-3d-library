import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget{
  const WebViewPage({Key? key, required this.modelUrl, required this.modelName}) : super(key: key);

  final String modelUrl;
  final String modelName;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              leading: BackButton(onPressed: () => Navigator.of(context).pop(),), 
              title: Text(modelName),
              centerTitle: true,
            ),
            body: WebView(
              gestureNavigationEnabled: true,
              initialUrl: modelUrl,
              javascriptMode: JavascriptMode.unrestricted,
            )
        )
      );
  }
}