
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:async';


import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import '../../../Provider/snackBar.dart';
import '../../../screen/screen1.dart';
import 'Login.dart';

 //////////

class VerifyEmailPageDoctor extends StatefulWidget {
  const VerifyEmailPageDoctor({super.key});

  @override
  State<VerifyEmailPageDoctor> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPageDoctor> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      // sendVerificationEmail(); /////////////////////stop

      timer = Timer.periodic(Duration(seconds: 3), (timer) async {
        // when we click on the link that existed on yahoo
       // await FirebaseAuth.instance.currentUser!.reload();  //////////////////////stop

        // is email verified or not (clicked on the link or not) (true or false)
        setState(() {
          isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
        });

        if (isEmailVerified) {
          timer.cancel();
        }
      });
    }
  }

  sendVerificationEmail() async {
    try {
       //  await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      setState(() {
        canResendEmail = false;
      });
      await Future.delayed(Duration(seconds: 5));
      setState(() {
        canResendEmail = true;
      });
    } catch (e) {
      showSnackBar(context, "ERROR => ${e.toString()}");
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isEmailVerified
    // ########################################################3333333
        ?  HomeScreen()
        : Scaffold(
      appBar: AppBar(
        title: Text("Verify Email"),
        elevation: 0,

      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "A verification email has been sent to your email",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {
               // sendVerificationEmail();
                 canResendEmail? sendVerificationEmail() : null;
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.blue),
                padding: WidgetStateProperty.all(EdgeInsets.all(12)),
                shape: WidgetStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
              ),
              child: Text(
                "Resent Email",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 11,
            ),
            TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginDoctor(),
                    ));

              },

              child: Text(
                "Cansel",
                style: TextStyle(fontSize: 20,color: Colors.red),

              ),
            ),
          ],
        ),
      ),
    );
  }
}