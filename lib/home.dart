import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'profilee_screen.dart';
// import 'auth_gate.dart'; // Import the AuthGate widget

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
            providers: [
              // EmailAuthProvider(),
              GoogleProvider(
                  clientId:
                      "491265368461-2gl0bjjj7ebr6qabbpk3dbrulfo1u5im.apps.googleusercontent.com"), // new
            ],
            headerBuilder: (context, constraints, shrinkOffset) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: AspectRatio(
                  aspectRatio: 3,
                  child: Image.asset('/mainlogo.jpg'),
                ),
              );
            },
          );
        } else {
          return HomeScreen();
        }
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Animal Detector'),
        actions: [
          IconButton(
            icon: SizedBox(
              width: 40,
              height: 40,
              child: CircleAvatar(
                backgroundColor: Colors.orange,
                backgroundImage: AssetImage('assets/default_avatar.png'),
              ),
            ),

            // Navigate to the user profile screen
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(
                    title: 'User Profile',
                  ),
                ),
              );
            },
          )
        ],
        automaticallyImplyLeading: false,
      ),

      // Display the home screen content
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/penguin_icon.jpg'),
            Text(
              'Welcome to Home Animal Detector!',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(height: 20),
            const SignOutButton(),
          ],
        ),
      ),
    );
  }
}
