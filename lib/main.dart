import 'package:complete/auth_gate.dart';
import 'package:complete/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// Replace the client ID with your own
const clientId =
    '491265368461-2gl0bjjj7ebr6qabbpk3dbrulfo1u5im.apps.googleusercontent.com';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor:
            Colors.white, // Set the default background color
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          displaySmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontSize: 16),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor:
              Colors.orange, // Set the AppBar background color to green
        ),
      ),
      home: AuthGate(),
    );
  }
}

// class AuthPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Implement your AuthPage UI here
//     return Container();
//   }
// }
