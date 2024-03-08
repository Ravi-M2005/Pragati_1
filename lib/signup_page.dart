// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'By signing up, you agree to our User Agreement and acknowledge that you understand the Privacy Policy.',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32.0),
              _buildTextFieldContainer('Name'),
              SizedBox(height: 16.0),
              _buildTextFieldContainer('Email'),
              SizedBox(height: 16.0),
              _buildTextFieldContainer('Password', obscureText: true),
              SizedBox(height: 16.0),
              _buildTextFieldContainer('Confirm Password', obscureText: true),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  // Perform sign-up logic here
                },
                child: Text('Sign Up'),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  TextButton(
                    onPressed: () {
                      // Navigate to the login page
                      Navigator.pop(context); // Go back to the previous page
                    },
                    child: Text('Log In'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldContainer(String label, {bool obscureText = false}) {
    return Container(
      width: 300.0, // Adjust the width as needed
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey[200],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: label,
          ),
        ),
      ),
    );
  }
}
