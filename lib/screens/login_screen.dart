import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameOrEmailPhoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false; // Variable to show loading state

  Future<void> _login(BuildContext context) async {
    final usernameOrEmailPhone = usernameOrEmailPhoneController.text.trim();
    final password = passwordController.text.trim();

    if (usernameOrEmailPhone.isNotEmpty && password.isNotEmpty) {
      setState(() {
        isLoading = true; // Show loading spinner while checking credentials
      });

      SharedPreferences prefs = await SharedPreferences.getInstance();

      // Check if the username exists in SharedPreferences
      String? savedPassword = prefs.getString(usernameOrEmailPhone);

      setState(() {
        isLoading = false; // Hide loading spinner after check
      });

      if (savedPassword != null && savedPassword == password) {
        // Save the username for future use
        await prefs.setString('username', usernameOrEmailPhone);  // Save the username

        // If credentials match, navigate to the home screen with the username
        Navigator.pushReplacementNamed(
          context,
          '/home',
          arguments: {'userName': usernameOrEmailPhone},
        );
      } else {
        // Show error if the password is incorrect
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid username or password')),
        );
      }
    } else {
      // Show error if the fields are empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all the fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2C16C),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5B3E0B),
                ),
              ),
              SizedBox(height: 30),
              // Input for Username, Email, or Phone
              TextField(
                controller: usernameOrEmailPhoneController,
                keyboardType: TextInputType.text, // Can be used for both email/phone or username
                decoration: InputDecoration(
                  hintText: 'Username, Email or Phone Number',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              SizedBox(height: 20),
              // Password input
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF5B3E0B),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                ),
                onPressed: isLoading ? null : () => _login(context), // Disable button if loading
                child: isLoading
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ) // Show loading spinner while logging in
                    : Text(
                        'LOGIN',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: Text(
                  'Don\'t have an account? Sign Up',
                  style: TextStyle(color: Color(0xFF5B3E0B)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
