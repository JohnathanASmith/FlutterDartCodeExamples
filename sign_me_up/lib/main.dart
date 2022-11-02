import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(title: "Sign Me Up", home: RegisterScreen()));
}

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(12),
        child: SignUpForm(),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isChecked = false;

  String? email;
  String? password;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(hintText: "Enter your email"),
            maxLength: 64,
            onChanged: (value) => email = value,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a username";
              } else {
                return null;
              }
            },
          ),
          TextFormField(
              decoration: InputDecoration(hintText: "Enter your password"),
              obscureText: true,
              onChanged: (value) => password = value,
              validator: (value) {
                if (value == null || value.length < 8) {
                  return "Your password must contain at least 8 characters";
                } else {
                  return null;
                }
              }),
          Row(
            children: [
              Checkbox(
                value: isChecked,
                onChanged: (checked) {
                  isChecked = checked!; // ! measn change form bool? to bool!
                  setState(() {});
                },
              ),
              const Text("I accept the Terms and Conditions.")
            ],
          ),
          if (!isChecked)
            Text(
              "You must accept the Terms and Conditions to proceed",
              style: TextStyle(color: Colors.red[800], fontSize: 12),
            ),
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate() && isChecked) {
                  print(
                      "Success! The $email is now signed up with password $password");
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content:
                          Text("Success Signing $email signing them up!")));
                } else {
                  print("User forgot to enter something");
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          "Fix any errors and accept the Terms and Conditions")));
                }
              },
              child: Text("Submit"))
        ],
      ),
    );
  }
}
