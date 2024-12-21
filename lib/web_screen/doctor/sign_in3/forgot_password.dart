



  import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:system_web/web_screen/doctor/sign_in3/Login.dart';

import '../../../Provider/snackBar.dart';
import '../../../Share/formtext.dart';

 ///////////////

class ForgotPasswordDoctor extends StatefulWidget {
  const ForgotPasswordDoctor({super.key});

  @override
  State<ForgotPasswordDoctor> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPasswordDoctor> {
  final emailController = TextEditingController();
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();


  resetPassword() async{

    showDialog(
        context: context,
        builder:(context){
          return const Center(
              child: CircularProgressIndicator(color: Colors.white,
              )
          );
        }
    );

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text);
      if (!mounted) return;
      showSnackBar2(context, 'Done - Please check your email');

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginDoctor(),
          ));
    }on FirebaseAuthException catch (e) {
      showSnackBar(context, ' Error : ${e.code}');


  }
    if (!mounted)return;
   // Navigator.pop(context);



  }


    @override
  void dispose() {
      // TODO: implement dispose
      emailController.dispose();

      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
        elevation: 0,

      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              const Text('Reset Password',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              const SizedBox(height: 20),
              const Text('Enter the email associated with yor account and we will send you a link to reset your password ',style: TextStyle(fontSize: 18,),),

              const SizedBox(height: 33),
              FromText(
                validator: (value) {
                  return value.contains(RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))
                      ? null
                      : 'Enter a valid email';
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controllerr: emailController,
                ispassword: false,
                TextInputTypeee: TextInputType.emailAddress,
                labelTextr: 'enter your email',
                prefixIconT: Icons.email_outlined,
                suffixIconn: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.visibility,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 33),
              Container(

                child: ElevatedButton(
                    onPressed: () async{
                      if (formKey.currentState!.validate()) {
                        resetPassword();




                      } else {
                        showSnackBar(context, 'Error');
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor:
                        WidgetStatePropertyAll(Colors.blue),
                        padding: WidgetStatePropertyAll(
                            const EdgeInsets.all(12)),
                        shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(10)))),
                    child: isLoading
                        ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                        : const Text(
                      'Reset Password ',
                      style: TextStyle(fontSize: 19),
                    )),
              ),




            ],

          ),
        ),
      ),
    );
  }
}
