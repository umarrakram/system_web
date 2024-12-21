
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

 import 'package:provider/provider.dart';
import 'package:system_web/screen/admin_page.dart';
import 'package:system_web/web_screen/doctor/sign_in3/signup.dart';

import '../../../Provider/google_signin.dart';
import '../../../Provider/snackBar.dart';
import '../../../Share/color.dart';
import '../../../Share/formtext.dart';
////////

class LoginDoctor extends StatefulWidget {
  const LoginDoctor({super.key});

  @override
  State<LoginDoctor> createState() => _LoginState();
}

class _LoginState extends State<LoginDoctor> {
  bool isSee = true;
  final emailControllerr = TextEditingController();
  final passwordControllerr = TextEditingController();

  logIn() async {
    try {
      showDialog(
          context: context,
          builder: (context) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.white,
            ));
          });

      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailControllerr.text, password: passwordControllerr.text);

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            //########################################333
            builder: (context) => AdminPage(),
          ));
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, ' Error : ${e.code}');
    }

    if (!mounted) return;
    Navigator.pop(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailControllerr.dispose();
    passwordControllerr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GoogleSignIn = Provider.of<GoogleSignInProvider>(context);

    double screenWidth = MediaQuery.of (context).size.width;
    double screenHeight = MediaQuery.of (context).size.height;
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

        /*  Image.asset(
            "assets/loginimg.jpg",
            // width: 200,
              height: screenHeight*.4,
          ), */
          Expanded(
            child: Container(



              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/Group 8.jpg"),
                      fit: BoxFit.fill)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 300,
                    child: FromText(
                      ispassword: false,
                      TextInputTypeee: TextInputType.emailAddress,
                      labelTextr: 'enter your email',
                      prefixIconT: Icons.email_outlined,
                      controllerr: emailControllerr,
                      suffixIconn: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.visibility,
                            color: Colors.white,
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 300,
                    child: FromText(
                      ispassword: isSee ? true : false,
                      TextInputTypeee: TextInputType.visiblePassword,
                      labelTextr: 'enter your password',
                      prefixIconT: Icons.lock,
                      controllerr: passwordControllerr,
                      suffixIconn: IconButton(
                          onPressed: () {
                            setState(() {
                              isSee = !isSee;
                            });
                          },
                          icon: isSee
                              ? const Icon(
                                  Icons.visibility,
                                )
                              : const Icon(
                                  Icons.visibility_off,
                                )),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () async {
                          await logIn();
                          if (!mounted) return;
                        },
                        style: ButtonStyle(
                            backgroundColor: const WidgetStatePropertyAll(blue),
                            padding:
                                const WidgetStatePropertyAll(EdgeInsets.all(12)),
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)))),
                        child: const Text(
                          'Log in ',
                          style: TextStyle(fontSize: subtitle, color: Colors.white),
                        )),
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                 /* GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgotPasswordDoctor(),
                          ));

                    },
                    child: const Text(
                      'Forgot Password ?',
                      style: TextStyle(
                          fontSize: subtitle2,
                          decoration: TextDecoration.underline,
                          color: blue),
                    ),
                  ), */
                  const SizedBox(
                    height: 0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Do not have an account?',
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterDoctor(),
                                ));
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                                decoration: TextDecoration.underline),
                          )),
                    ],
                  ),
                ],
                          ),
              ),),
          ),
          // const SizedBox(
          //   height: 7,
          // ),
          // const SizedBox(
          //   width: 299,
          //   child: Row(
          //     children: [
          //       Expanded(
          //           child: Divider(
          //         thickness: 0.6,
          //         color: black2,
          //       )),
          //       Text(
          //         "  OR  ",
          //         style: TextStyle(
          //           color: blue,
          //         ),
          //       ),
          //       Expanded(
          //           child: Divider(
          //         thickness: 0.6,
          //         color: black2,
          //       )),
          //     ],
          //   ),
          // ),
          // Container(
          //     margin: const EdgeInsets.symmetric(vertical: 27),
          //     child: Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           GestureDetector(
          //             onTap: () {
          //               GoogleSignIn.googlelogin();
          //             },
          //             child: Container(
          //               padding: const EdgeInsets.all(12),
          //               decoration: BoxDecoration(
          //                   shape: BoxShape.circle,
          //                   border:
          //                       Border.all(color: Colors.red, width: 1)),
          //               child: SvgPicture.asset(
          //                 "assets/icons/icons8-google (1).svg",
          //                 color: Colors.red[400],
          //                 height: 27,
          //               ),
          //             ),
          //           ),
          //         ]))
        ],
      ),
    );
  }
}

//abdullah@abdullah240.onmicrosoft.com    Asdfghjklasdfghjkl1
