import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:system_web/screen/customer_page.dart';
import 'package:system_web/screen/screen1.dart';
import 'Provider/google_signin.dart';
import 'Provider/snackBar.dart';
import 'firebase_options.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCttkL9_wKXK7zuLPP5r-CiwfEAkYJmmhM",
            authDomain: "customer-system-bca9b.firebaseapp.com",
            projectId: "customer-system-bca9b",
            storageBucket: "customer-system-bca9b.firebasestorage.app",
            messagingSenderId: "535281092603",
            appId: "1:535281092603:web:9cbddfa85222b67342ad5e"
        ));
  } else {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        ChangeNotifierProvider(create: (context) {
          return GoogleSignInProvider();
        }),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ));
              } else if (snapshot.hasError) {
                return showSnackBar(context, "Something went wrong");
              } else if (snapshot.hasData) {
                return const CustomerPage();             // VerifyEmailPage(); // home() OR verify email
              } else {
                return const HomeScreen();
              }
            },
          )),
    );
  }
}
