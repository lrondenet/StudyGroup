import 'package:flutter/material.dart';
//import 'package:google_sign_in/google_sign_in.dart';
//import 'package:firebase_auth/firebase_auth.dart';

// Initializes GoogleSignIn & FirebaseAuth
//final GoogleSignIn _googleSignIn = GoogleSignIn();
//final FirebaseAuth _auth = FirebaseAuth.instance;

// Stateful Login Page Class
class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);
  final String title;

  // Creates the stateful widget LoginPage
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Main build function, generates the view
  @override
  Widget build(BuildContext context) {
    // Scaffold is from MaterialApp. Implements the basic visual layout
    return Scaffold(
      appBar: AppBar(
        // Top bar, title is set using widget.title which is passed down from main
        title: Text(widget.title),
      ),
      // Container: UI for Login Form
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text(
              'Login Information',
              style: TextStyle(fontSize: 20),
              ),
              // Email field
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: "Email Address")),
              // Password field - actual typed letters are hidden
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(labelText: "Password")),
              // Login button
              RaisedButton(
                textColor: Colors.white,
                color: Colors.grey,
                child: Text('Login'), 
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

/* The following code is for Google Authentication, currently in the works and
    will be comment out for now.

    Handles authentication of user sign-in
    Taken from: https://pub.dev/packages/firebase_auth
    Using for authentication testing for now.

Future<FirebaseUser> _handleSignIn() async {
  final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
  print("signed in " + user.displayName);
  return user;
}
 
    From sign-in button onPress call _handleSignIn() method 
    using a future callback for both FirebaseUser and possible exception
    _handleSignIn()
        .then((FirebaseUser user) => print(user))
        .catchError((e) => print(e));
*/
