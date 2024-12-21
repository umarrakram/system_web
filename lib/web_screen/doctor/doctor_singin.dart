import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'sign_in3/Login.dart';
import 'sign_in3/signup.dart';


class DoctorSignin extends StatelessWidget {
  const DoctorSignin({super.key});

  @override
  Widget build(BuildContext context) {
    final Screenwidth = MediaQuery.of(context).size.width;
    final Screenheight = MediaQuery.of(context).size.height;
    return  Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(backgroundColor: Colors.blue,
      leading: const Text("data",style: TextStyle(color: Colors.blue),),),

      body: Column(
        children: [
          SizedBox(
            width: Screenwidth,
            height: Screenheight-200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Hello, Doctor",style: TextStyle(fontSize: 50),),
                const Text("Welcome to Medical History Record",style: TextStyle(fontSize: 30),),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ****************************88
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  RegisterDoctor(),
                          ),
                        );
                      },
                      child: Container(
                        height: 30,
                        width: Screenwidth * .1,
                        color: Colors.red,
                        child: const Center(
                            child: Text(
                              "Sign Up",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ),
                    // *********************88
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  LoginDoctor(),
                          ),
                        );
                      },
                      child: Container(
                        height: 30,
                        width: Screenwidth * .1,
                        color: Colors.green,
                        child: const Center(
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}