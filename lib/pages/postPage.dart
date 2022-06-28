// ignore: file_names
import 'package:flutter/material.dart';
import '../generated/l10n.dart';
import '../models/model.dart';
import 'webViewPage.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key, required this.model}) : super(key: key);

  final Model model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(model.name)
        ),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
              child: Text(
                model.name,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 215, 215, 215),
              ),
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.fromLTRB(25, 25, 25, 0),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
              child: GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WebViewPage(
                            modelName: model.name, modelUrl: model.url))),
                child: ClipRRect(
                  child: Image.network(model.imagePath),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      text: S.of(context).by,
                      style: const TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: model.author,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      const Text("25"),
                      const SizedBox(
                        width: 5,
                      ),
                      Stack(alignment: Alignment.center, children: [
                        Container(
                          width: 20.0,
                          height: 20.0,
                          decoration: const BoxDecoration(
                            color: Colors.pink,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const Icon(
                          Icons.favorite,
                          color: Colors.white,
                          size: 15,
                        )
                      ]),
                      const SizedBox(
                        width: 25,
                      ),
                      Text(model.comments.length.toString()),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.comment,
                        size: 20,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(model.description),
                  const Text("especificações"),
                  const SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                    itemBuilder: ((context, index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 1.0),
                          child: Row(
                            children: [
                              Transform.scale(
                                child: const Icon(
                                  Icons.reply,
                                ),
                                scale: -1,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  model.comments[index].username,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Flexible(
                                child: Text(model.comments[index].body),
                              ),
                            ],
                          ),
                        )),
                    itemCount: model.comments.length,
                    shrinkWrap: true,
                  )
                ],
              ),
            ),
          ]),
        ));
  }
}
