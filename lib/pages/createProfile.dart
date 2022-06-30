import 'package:flutter/material.dart';
import 'package:flutter3d/providers/auth_provider.dart';
import 'package:flutter3d/showAlert.dart';
import 'package:flutter3d/upload_file_button.dart';
import 'package:provider/provider.dart';

import '../generated/l10n.dart';
import '../storage_service_file.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  final TextEditingController _displayNameField = TextEditingController();
  final Storage storage = Storage();

  Future<void> _confirmProfileData() async {
    if (_displayNameField.text.isEmpty) {
      showAlert(context, S.of(context).displayNameMissing);
      // } else if (_photoURLField.text.isEmpty) {
      //   showAlert(context, "photo missing");
    } else {
      String? imageUrl;
      try {
        imageUrl = await storage.getUrl(_displayNameField.text +
            "_" +
            Provider.of<AuthProvider>(context, listen: false).user!.uid);
      } catch (e) {
        print(e);
      }
      Provider.of<AuthProvider>(context, listen: false)
          .UpdateProfile(_displayNameField.text, imageUrl ?? "");
      Provider.of<AuthProvider>(context, listen: false).signOut();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Create Profile")),
        body: Container(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: const TextStyle(color: Colors.black),
                  controller: _displayNameField,
                  decoration:
                      InputDecoration(hintText: S.of(context).displayName),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 35),
              Card(
                  child: UploadFileButton(
                fileName: _displayNameField.text +
                    "_" +
                    Provider.of<AuthProvider>(context).user!.uid,
                title: "Upload profile image",
              )),
              SizedBox(height: MediaQuery.of(context).size.height / 35),
              Container(
                width: MediaQuery.of(context).size.width / 1.4,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.deepPurple,
                ),
                child: MaterialButton(
                  onPressed: () => _confirmProfileData(),
                  child: Text(
                    "Confirm",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
