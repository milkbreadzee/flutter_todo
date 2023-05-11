import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/todo_tile.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          colors: [Color(0xfff594b5), Color(0xffffffff)],
          stops: [0, 1],
          center: Alignment.center,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          leading: new Image.asset("lib/assets/bunny.png"),
          backgroundColor: Color(0xfff594b5),
        ),
        body: ListView(children: [
          const SizedBox(height: 25,),
          TodoTile(
            taskName: "do work",
            taskCompleted: false,
            onChanged:(p0) => {},
          ),
        ]),
      ),
    );

    // appBar: AppBar(
    //   elevation: 0,
    //   leading: new Image.asset("lib/assets/bunny.png"),
    //   backgroundColor: Color(0xfff594b5),

    // ),
    // body: Center(
    //   child: ElevatedButton(
    //     child: Text("LogOut"),
    //     onPressed: () {
    //       FirebaseAuth.instance.signOut().then((value) {
    //         Navigator.push(context,
    //             MaterialPageRoute(builder: (context) => LoginPage()));
    //       });
    //     },
    //   ),
    // ),
  }
}
