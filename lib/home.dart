// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Model {
  final String name;
  final String view_url;
  final String description;
  final String image_url;
  final int n_triangles;

  Model(this.name, this.view_url, this.description, this.image_url, this.n_triangles);

}

class ListModels extends StatefulWidget {
  const ListModels({Key? key}) : super(key: key);

  @override
  State<ListModels> createState() => _ListModelsState();
}

class _ListModelsState extends State<ListModels> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              return ListView(
                  children: snapshot.data!.docs.map((document) {

                print(document.toString());
                return Row(children: [
                  Text("Model Name: ${document.id}"),
                ]);
              }).toList());
            },
          ),
        ),
      ),
    );
  }
}
