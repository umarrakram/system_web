import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GetDataFromFirestoreImgUser extends StatefulWidget {


  const GetDataFromFirestoreImgUser({super.key,  });

  @override
  State<GetDataFromFirestoreImgUser> createState() => _GetDataFromFirestoreState();
}

class _GetDataFromFirestoreState extends State<GetDataFromFirestoreImgUser> {



  final credential = FirebaseAuth.instance.currentUser;
  CollectionReference users = FirebaseFirestore.instance.collection('usersss');



  @override
  Widget build(BuildContext context) {
    CollectionReference users =
    FirebaseFirestore.instance.collection('usersss');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(credential!.uid).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return   const Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
          snapshot.data!.data() as Map<String, dynamic>;
          //////////////////////////////////////// ${data['username']}
          return   CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 75,

              backgroundImage: data['imglink'] == null ? const NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXwVMBH75TaekX3rtcgkfKaoMOUHvTc2C17g&usqp=CAU") : NetworkImage("${data['imglink']}")
          )   ;


        }

        return const Text("loading");
      },
    );
  }
}
