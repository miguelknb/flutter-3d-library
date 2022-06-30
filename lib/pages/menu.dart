import 'package:flutter/material.dart';
import 'package:flutter3d/models/user_model.dart';
import 'package:flutter3d/pages/home.dart';
import 'package:flutter3d/pages/add_model.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key, required this.user}) : super(key: key);

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          UserAccountsDrawerHeader(
            margin: EdgeInsets.zero,
            accountName: Text(user.displayName!),
            accountEmail: Text(user.email!),
            currentAccountPicture: CircleAvatar(
                backgroundImage:
                    user.photoUrl != null ? NetworkImage(user.photoUrl!) : null,
                child:
                    user.photoUrl == null ? Text(user.displayName![0]) : null),
          ),
          ListTile(
            title: Text("Modelos"),
            leading: Icon(Icons.list),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListModels(),
                ),
              );
            },
          ),
          ListTile(
            title: Text("Publicar"),
            leading: Icon(Icons.publish_sharp),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddModel(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
