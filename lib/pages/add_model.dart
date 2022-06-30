// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter3d/providers/auth_provider.dart';
import 'package:flutter3d/storage_service_file.dart';
import 'package:flutter3d/upload_file_button.dart';
import '../providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as p;

import 'home.dart';
import 'dart:math';

final _random = Random();

// Future<AuthResponse> postModel(String name, String url, String description) async {
//   final storageRef = FirebaseStorage.instance.ref();
// }

class AddModel extends StatefulWidget {
  const AddModel({Key? key}) : super(key: key);

  @override
  State<AddModel> createState() => _AddModelState();
}

class _AddModelState extends State<AddModel> {
  final TextEditingController _nameField = TextEditingController();
  final TextEditingController _descriptionField = TextEditingController();
  final TextEditingController _urlField = TextEditingController();
  String fileName = "";
  String imageUrl = "";

  void showAlert(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(message),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider ap = Provider.of<AuthProvider>(context, listen: false);

    final userId = ap.user?.uid;

    CollectionReference modelsRef =
        FirebaseFirestore.instance.collection('Models');

    final Storage storage = Storage();

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.deepPurple,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.3,
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                controller: _nameField,
                decoration: InputDecoration(
                    labelText: "Nome do Modelo",
                    labelStyle: TextStyle(
                      color: Colors.white,
                    )),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.3,
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                controller: _urlField,
                decoration: InputDecoration(
                    labelText: "Url do Modelo",
                    labelStyle: TextStyle(
                      color: Colors.white,
                    )),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.3,
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                controller: _descriptionField,
                decoration: InputDecoration(
                    labelText: "Descrição do modelo",
                    labelStyle: TextStyle(
                      color: Colors.white,
                    )),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              child:
                  UploadFileButton(fileName: _nameField.text + "_" + userId!, title: 'Upload Model Image',),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              child: MaterialButton(
                onPressed: () async {
                  String imageUrlFinal = await storage.getUrl(fileName);

                  modelsRef.add({
                    'name': _nameField.text,
                    'description': _descriptionField.text,
                    'view_url': _urlField.text,
                    'created_by': userId,
                    'image_url': imageUrlFinal,
                    'n_triangles': 120 + _random.nextInt(18000 - 120)
                  }).then((value) {
                    () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ListModels(),
                          ),
                        );
                  }).catchError((error) {
                    print(error);
                  });
                  // showAlert(response.message);
                },
                child: Text("Confirmar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
