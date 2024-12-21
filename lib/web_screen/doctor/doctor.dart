import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../Provider/snackBar.dart';
import '../../Share/formtext.dart';


class Doctor extends StatefulWidget {
  const Doctor({super.key});

  @override
  State<Doctor> createState() => _DoctorState();
}

class _DoctorState extends State<Doctor> {


  List users = [];
  //CollectionReference
  DocumentReference usersref = FirebaseFirestore.instance.collection('Doctors').doc("${FirebaseAuth.instance.currentUser!.email}");


  GetData()async{
    var response = await usersref.get();
    // 1 doc
    setState(() {
      users.add(response.data());
    });

    //all doc
    // response.docs.forEach((element) {
    //   setState(() {
    //     users.add(element.data());
    //
    //   });
    // }) ;
  }


  @override
  void initState() {
    GetData();
    super.initState();
  }
//************************************************************












  final Stream<QuerySnapshot> usersStream =
      FirebaseFirestore.instance.collection('usersss').snapshots();


  final formKey = GlobalKey<FormState>();
  final dataController = TextEditingController();
  final hospitalController = TextEditingController();
  final doctorrController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    final Screenwidth = MediaQuery.of(context).size.width;
    final Screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Row(
        children: [
          Container(
            height: Screenheight,
            width: Screenwidth * .2,
            color: Colors.blue,
            child: Column(
              children: [
                Container(
                  width: 80,
                  height: 100,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Icon(
                    Icons.person,
                    size: 50,
                  ),
                ),
                const Text(
                  "Doctor",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "${users[0]["username"]}",
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 12.0),
                      child: Text(
                        "Patient",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Colors.white,
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 700,
            width: Screenwidth * .8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 700,
                  width: Screenwidth * .6,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 25,
                        color: Colors.blue,
                        child: Center(
                            child: Text(
                          "Patient",
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Name                       "),
                          Text("Mobile    "),
                          Text("Address"),
                          Text("Appointment"),
                          Text("Delete"),
                        ],
                      ),
                      Divider(),
                      StreamBuilder<QuerySnapshot>(
                        stream: usersStream,
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Text('Something went wrong');
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Text("Loading");
                          }

                          return SizedBox(
                            height: Screenheight * .8,
                            width: Screenwidth * .9,
                            child: ListView(
                              children: snapshot.data!.docs
                                  .map((DocumentSnapshot document) {
                                Map<String, dynamic> data =
                                    document.data()! as Map<String, dynamic>;
                                return Column(
                                  children: [
                                    Container(
                                      height: 200,
                                      width: Screenwidth * .6,
                                      child: ListView.builder(
                                        itemCount: snapshot.data!.docs.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  " ${snapshot.data!.docs[index]["username"]}",

                                                ),
                                                Text("${snapshot.data!.docs[index]["Mobile"]}"),
                                                Text("${snapshot.data!.docs[index]["Gender"]}"),
                                                GestureDetector(
                                                    onTap: () {
                                                      
                                                       showDialog(context: context, builder:(context)=>AlertDialog (
                                                       
                                                         actions: [
                                                            IconButton(onPressed: ( )async{




                                                              if (formKey.currentState!.validate()) {

                                                                // && imgName !=null && imgPath != null
                                                                CollectionReference users =
                                                                FirebaseFirestore.instance.collection('usersss');

                                                                users
                                                                    .doc( "${snapshot.data!.docs[index]["email"]}").collection('Appointment')

                                                                    .add({
                                                                  'hospital': hospitalController.text,
                                                                  'doctorrN': doctorrController.text,
                                                                  'data':  dataController.text,

                                                                });



                                                                Navigator.of(context).pop();
                                                              } else {
                                                                showSnackBar(context, 'Error');
                                                              }







                                                            }, icon: Text("Add",style: TextStyle(color: Colors.blue),))
                                                         ],
                                                         title:  Column(
                                                           children: [
                                                             Form(
                                                               key: formKey,
                                                               child: Column(
                                                                 children: [
                                                                   //1


                                                                   //2
                                                                   FromText(
                                                                     validator: (value) {
                                                                       if (value == null || value.isEmpty) {
                                                                         return 'Please enter some text';
                                                                       }
                                                                       return null;},
                                                                     controllerr:dataController ,
                                                                     ispassword:  false,
                                                                     TextInputTypeee: TextInputType.text,
                                                                     labelTextr: 'Enter the date ',
                                                                     prefixIconT: Icons.hdr_strong_outlined,
                                                                     suffixIconn: IconButton(
                                                                         onPressed: () {},
                                                                         icon: Icon(
                                                                           Icons.visibility,
                                                                           color: Colors.white,
                                                                         )),
                                                                   ),
                                                                   SizedBox(
                                                                     height: 30,
                                                                   ),
                                                                   FromText(
                                                                     validator: (value) {
                                                                       if (value == null || value.isEmpty) {
                                                                         return 'Please enter some text';
                                                                       }
                                                                       return null;},
                                                                     controllerr:doctorrController ,
                                                                     ispassword:  false,
                                                                     TextInputTypeee: TextInputType.text,
                                                                     labelTextr: 'enter doctor name',
                                                                     prefixIconT: Icons.drive_file_rename_outline,
                                                                     suffixIconn: IconButton(
                                                                         onPressed: () {},
                                                                         icon: Icon(
                                                                           Icons.visibility,
                                                                           color: Colors.white,
                                                                         )),
                                                                   ),
                                                                   SizedBox(
                                                                     height: 30,
                                                                   ),
                                                                   FromText(
                                                                     validator: (value) {
                                                                       if (value == null || value.isEmpty) {
                                                                         return 'Please enter some text';
                                                                       }
                                                                       return null;},
                                                                     controllerr:hospitalController ,
                                                                     ispassword:  false,
                                                                     TextInputTypeee: TextInputType.text,
                                                                     labelTextr: 'enter hospital name',
                                                                     prefixIconT: Icons.local_hospital,
                                                                     suffixIconn: IconButton(
                                                                         onPressed: () {},
                                                                         icon: Icon(
                                                                           Icons.visibility,
                                                                           color: Colors.white,
                                                                         )),
                                                                   ),
                                                                   SizedBox(
                                                                     height: 30,
                                                                   ),


                                                                 ],
                                                               ),
                                                             ),




                                                           ],
                                                         ),
                                                       )
                                                       );
                                                    },
                                                    child: Text("Add          ",
                                                        style: TextStyle(
                                                             color: Colors.blue))),
                                                // ******************************************************8888
                                                IconButton(
                                                    onPressed: () async {
                                                      await FirebaseFirestore
                                                          .instance
                                                          .collection('usersss')
                                                          .doc(
                                                              "${snapshot.data!.docs[index]["email"]}")
                                                          .delete();
                                                      setState(() {});
                                                    },
                                                    icon: Icon(
                                                      Icons.delete,
                                                      color: Colors.red,
                                                    ))
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                );
                              }).toList(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
