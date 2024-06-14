import 'package:flutter/material.dart';
import 'package:raisya_coffe/home_screen.dart';
import 'package:raisya_coffe/register.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/login.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Stack(
            children: [
              // Cozy Coffee Text
              Positioned(
                top: 120,
                left: 16,
                right: 16,
                child: Center(
                  child: Text(
                    'Cozy Coffee',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black,
                          offset: Offset(1.0, 1.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Card(
                    elevation: 4.0,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              controller: _emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                } else if (!RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) {
                                  return 'Please enter a valid email address';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                labelText: 'Email',
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            TextFormField(
                              controller: _passwordController,
                              validator: ((value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              }),
                              decoration: const InputDecoration(
                                labelText: 'Password',
                              ),
                              obscureText: true,
                            ),
                            const SizedBox(height: 16.0),

                            // Need Account?
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Need an account?'),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const RegisterPage(),
                                      ),
                                    );
                                  },
                                  child: const Text('Register'),
                                ),
                              ],
                            ),
                            // Login Button
                            ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  try {
                                    // User signed in successfully
                                    // Navigate to HomeScreen or any other page
                                    Navigator.push(
                                      // ignore: use_build_context_synchronously
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomeScreen()),
                                    );
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'user-not-found') {
                                      // ignore: avoid_print
                                      print('No user found for that email.');
                                    } else if (e.code == 'wrong-password') {}
                                    // ignore: empty_catches
                                  } catch (e) {}
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 50,
                                  vertical: 10,
                                ),
                              ),
                              child: const Text(
                                'Login',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
