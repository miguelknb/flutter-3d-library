import 'package:flutter/material.dart';
import 'package:flutter3d/auth.dart';
import 'package:flutter3d/providers/auth_provider.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider())
      ],
      child: const App()
    )
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,  
          textTheme: GoogleFonts.interTextTheme()
        ),
        title: "3D Library Chad",
        home: const Authentication(),
    );
  }
}
