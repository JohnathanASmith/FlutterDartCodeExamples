import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  runApp(const MaterialApp(title: "Firebase Example", home: LoginScreen()));
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Welcome")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome ${FirebaseAuth.instance.currentUser?.email}"),
            ElevatedButton(
              onPressed: () {
                // signOut() doesn't return anything, so we don't need to await
                // for it to finish unless we really want to.
                FirebaseAuth.instance.signOut();

                // This navigator call clears the Navigation stack and takes
                // them to the login screen because we don't want users
                // "going back" in our app after they log out.
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                    (route) => false);
              },
              child: const Text("Logout"),
            )
          ],
        ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;
  String? password;
  String? error;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    void tryLogin() async {
      try {
        // The await keyword blocks execution to wait for
        // signInWithEmailAndPassword to complete its asynchronous execution and
        // return a result.
        //
        // FirebaseAuth with raise an exception if the email or password
        // are determined to be invalid, e.g., the email doesn't exist.
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email!, password: password!);
        print("Logged in ${credential.user}");
        error = null; // clear the error message if exists.
        setState(() {}); // Call setstate to trigger a rebuild

        // We need this next check to use the Navigator in an async method.
        // It basically makes sure LoginScreen is still visible.
        if (!mounted) return;

        // pop the navigation stack so people cannot "go back" to the login screen
        // after logging in.
        Navigator.of(context).pop();
        // Now go to the HomeScreen.
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ));
      } on FirebaseAuthException catch (e) {
        // Exceptions are raised if the Firebase Auth service
        // encounters an error. We need to display these to the user.
        if (e.code == 'user-not-found') {
          error = 'No user found for that email.';
        } else if (e.code == 'wrong-password') {
          error = 'Wrong password provided for that user.';
        }

        // Call setState to redraw the widget, which will display
        // the updated error text.
        setState(() {});
      }
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                  decoration:
                      const InputDecoration(hintText: 'Enter your email'),
                  maxLength: 64,
                  onChanged: (value) => email = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null; // Returning null means "no issues"
                  }),
              TextFormField(
                  decoration:
                      const InputDecoration(hintText: "Enter a password"),
                  obscureText: true,
                  onChanged: (value) => password = value,
                  validator: (value) {
                    if (value == null || value.length < 8) {
                      return 'Your password must contain at least 8 characters.';
                    }
                    return null; // Returning null means "no issues"
                  }),
              const SizedBox(height: 16),
              ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // This calls all validators() inside the form for us.
                      tryLogin();
                    }
                  }),
              const SizedBox(height: 16),
              ElevatedButton(
                  child: const Text('Sign Up'),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ));
                  }),
              if (error != null)
                Text(
                  "Error: $error",
                  style: TextStyle(color: Colors.red[800], fontSize: 12),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? email;
  String? password;
  String? password2;
  String? error;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    void trySignup() async {
      try {
        // The await keyword blocks execution to wait for
        // signInWithEmailAndPassword to complete its asynchronous execution and
        // return a result.
        //
        // FirebaseAuth with raise an exception if the email or password
        // are determined to be invalid, e.g., the email doesn't exist.
        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email!, password: password!);
        print("Logged in ${credential.user}");
        error = null; // clear the error message if exists.
        setState(() {}); // Call setstate to trigger a rebuild

        // We need this next check to use the Navigator in an async method.
        // It basically makes sure LoginScreen is still visible.
        if (!mounted) return;

        // pop the navigation stack so people cannot "go back" to the login screen
        // after logging in.
        Navigator.of(context).pop();
        // Now go to the HomeScreen.
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ));
      } on FirebaseAuthException catch (e) {
        // Exceptions are raised if the Firebase Auth service
        // encounters an error. We need to display these to the user.
        print(e);
        if (e.code == 'email-already-in-use') {
          error = 'Email already taken';
        }

        // Call setState to redraw the widget, which will display
        // the updated error text.
        setState(() {});
      }
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                  decoration:
                      const InputDecoration(hintText: 'Enter your email'),
                  maxLength: 64,
                  onChanged: (value) => email = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null; // Returning null means "no issues"
                  }),
              TextFormField(
                  decoration:
                      const InputDecoration(hintText: "Enter a password"),
                  obscureText: true,
                  onChanged: (value) => password = value,
                  validator: (value) {
                    if (value == null || value.length < 8) {
                      return 'Your password must contain at least 8 characters.';
                    }
                    return null; // Returning null means "no issues"
                  }),
              const SizedBox(height: 16),
              TextFormField(
                  decoration:
                      const InputDecoration(hintText: "Re-enter a password"),
                  obscureText: true,
                  onChanged: (value) => password2 = value,
                  validator: (value) {
                    if (value == null || value.length < 8) {
                      return 'Your password must contain at least 8 characters.';
                    } else if (password != password2) {
                      return 'Passwords do not match.';
                    }
                    return null; // Returning null means "no issues"
                  }),
              const SizedBox(height: 16),
              ElevatedButton(
                  child: const Text('Sign Up'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // This calls all validators() inside the form for us.
                      trySignup();
                    }
                  }),
              if (error != null)
                Text(
                  "Error: $error",
                  style: TextStyle(color: Colors.red[800], fontSize: 12),
                ),
              const SizedBox(height: 16),
              ElevatedButton(
                  child: const Text('Back to Login'),
                  onPressed: () {
                    Navigator.maybePop(context);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
