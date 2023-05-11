import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/customtext_field.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  void signUpUser() async {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: usernameController.text, password: passwordController.text)
        .then((value) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }).onError((error, stackTrace) {
      print(error.toString());
    });
  }

  // void signUpWithGoogle() {}

  void signUpWithGoogle() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              //logo
              const Image(
                image: AssetImage('lib/assets/pink-bow.png'),
                height: 100,
                width: 100,
              ),

              // const SizedBox(
              //   height: 25,
              // ),
              //wlecome
              Text(
                'Welcome back!',
                style: GoogleFonts.dancingScript(
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(
                height: (MediaQuery.of(context).size.height) * 0.05,
              ),

              // const Padding(
              //   padding: EdgeInsets.all(25.0),
              //   child: Text(
              //     'Choose your likes and dislikes from from 50+ topics and get access to insights about brands like never before.',
              //     textAlign: TextAlign.center,
              //     style: TextStyle(
              //       color: Colors.black,
              //       fontSize: 16,
              //       fontWeight: FontWeight.normal,
              //     ),
              //   ),
              // ),

              // const SizedBox(
              //   height: 10,
              // ),

              CustomTextField(
                controller: nameController,
                hintText: 'Please enter your name',
                obscureText: false,
              ),

              const SizedBox(
                height: 10,
              ),

              //username
              CustomTextField(
                controller: usernameController,
                hintText: 'Please enter your email',
                obscureText: false,
              ),

              const SizedBox(
                height: 10,
              ),

              //password

              CustomTextField(
                controller: passwordController,
                hintText: 'Please enter your password',
                obscureText: true,
              ),

              const SizedBox(
                height: 10,
              ),

              //forgot pass

              // const Text(
              //   "forgot password?",
              //   style: TextStyle(color: Colors.blue),
              // ),

              // Display the available topics and let the user select their preferences

              const SizedBox(
                height: 25,
              ),

              //sign in
              GestureDetector(
                onTap: signUpUser,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.pink.shade600,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 25,
              ),

              //https://developers.google.com/identity/branding-guidelines

              GestureDetector(
                // onTap: signInWithGoogle,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      "Sign Up With Google",
                      style: TextStyle(
                        color: Colors.pink.shade600,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an acount?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    child: Text(
                      'Log In',
                      style: TextStyle(
                          color: Colors.pink.shade600,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
