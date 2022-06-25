// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../generated/l10n.dart';
import '../models/model.dart';
import 'postPage.dart';
import 'webViewPage.dart';

class ListModels extends StatefulWidget {
  const ListModels({Key? key}) : super(key: key);

  @override
  State<ListModels> createState() => _ListModelsState();
}

class _ListModelsState extends State<ListModels> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).modelList),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('Models').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              final models = snapshot.data!.docs.map((doc) => doc).toList();

              return ListView.builder(
                itemCount: models.length,
                itemBuilder: (BuildContext ctx, int index) {
                  var currentModel = models[index];
                  Model finalModel = Model.simple(
                      currentModel["name"],
                      currentModel["view_url"],
                      currentModel["description"],
                      currentModel["image_url"]);

                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostPage(
                          model: finalModel,
                        ),
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(13.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  finalModel.name,
                                  softWrap: true,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  finalModel.description,
                                  softWrap: true,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 80,
                            height: 80,
                            child: GestureDetector(
                              onLongPress: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WebViewPage(
                                      modelName: finalModel.name,
                                      modelUrl: finalModel.url),
                                ),
                              ),
                              child: ClipRRect(
                                child: Image.network(finalModel.imagePath),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
