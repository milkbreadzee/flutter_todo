import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_application_1/components/customtext_field.dart";
import "package:flutter_application_1/pages/home_page.dart";
import "package:flutter_application_1/pages/signup_page.dart";
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  var _isObscured = true;

  void loginUser() async {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: usernameController.text, password: passwordController.text)
        .then((value) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }).onError((error, stackTrace) {
      print(error.toString());
    });
  }

  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
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

              CustomTextField(
                controller: usernameController,
                hintText: 'Please enter your email',
                obscureText: false,
              ),

              const SizedBox(
                height: 10,
              ),

              //password

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: _isObscured,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      padding: const EdgeInsetsDirectional.only(end: 10),
                      icon: _isObscured
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isObscured = !_isObscured;
                        });
                      },
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.pink.shade200),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink.shade500),
                        borderRadius: BorderRadius.circular(25)),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Please enter your password",
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              //forgot pass

              Text(
                'forgot password',
                style: GoogleFonts.dancingScript(
                  textStyle: const TextStyle(
                    color: Colors.pink,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              //log in

              const SizedBox(
                height: 25,
              ),

              GestureDetector(
                onTap: loginUser,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      "Login",
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
                      "Sign In With Google",
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
                    'Dont have an acount?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                          color: Colors.pink.shade600,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignupPage(),
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

class CustomButton extends StatefulWidget {
  final Function()? onTap;

  const CustomButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          _isLoading = true;
        });

        await widget.onTap?.call();

        setState(() {
          _isLoading = false;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: _isLoading
              ? CupertinoActivityIndicator(
                  color: Colors.white,
                )
              : Text(
                  "Log In",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
        ),
      ),
    );
  }
}
