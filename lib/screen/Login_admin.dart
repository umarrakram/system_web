import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:system_web/screen/admin_page.dart';

import '../../../Provider/google_signin.dart';
import '../../../Share/color.dart';
import '../../../Share/formtext.dart';
////////

class LoginAdmin extends StatefulWidget {
  const LoginAdmin({super.key});

  @override
  State<LoginAdmin> createState() => _LoginAdminState();
}

class _LoginAdminState extends State<LoginAdmin> {
  bool isSee = true;
  final emailControllerr = TextEditingController();
  final passwordControllerr = TextEditingController();

  logIn() async {

      showDialog(
          context: context,
          builder: (context) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.white,
            ));
          });

      if(emailControllerr.text=="admin"&&passwordControllerr.text=="20242024"){

        return Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              //########################################333
              builder: (context) => AdminPage(),
            ));

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

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
                        labelTextr: 'enter your ID',
                        prefixIconT: Icons.perm_identity_outlined,
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
                              backgroundColor:
                                  const WidgetStatePropertyAll(blue),
                              padding: const WidgetStatePropertyAll(
                                  EdgeInsets.all(12)),
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15)))),
                          child: const Text(
                            'Login Admin',
                            style: TextStyle(
                                fontSize: subtitle, color: Colors.white),
                          )),
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//abdullah@abdullah240.onmicrosoft.com    Asdfghjklasdfghjkl1
