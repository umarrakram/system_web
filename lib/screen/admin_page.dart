import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


import '../Provider/snackBar.dart';
import '../Share/formtext.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {

//************************************************************

  final Stream<QuerySnapshot> usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();

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
                  child: const Icon(
                    Icons.person,
                    size: 50,
                  ),
                ),
                const Text(
                  "Admin",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Ahmed",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),

              ],
            ),
          ),
          Container(



            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/image1.jpg"),
                    fit: BoxFit.fill)),

            height: double.infinity,
            width: Screenwidth * .8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height:double.infinity,
                    width: Screenwidth * .6,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 25,
                          color: Colors.blue,
                          child: const Center(
                              child: Text(
                            "Admin page",
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(

                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Customer Name ",style: TextStyle(color: Colors.white),),
                              Text("Delete",style: TextStyle(color: Colors.white),),
                            ],
                          ),
                        ),
                        const Divider(),
                        StreamBuilder<QuerySnapshot>(
                          stream: usersStream,
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasError) {
                              return const Text('Something went wrong');
                            }

                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Text("Loading");
                            }

                            return Container(
                               child: SizedBox(
                                height: Screenheight * .8,
                                width: Screenwidth * .9,
                                child:  Column(
                                  children: [
                                    SizedBox(
                                      height: Screenheight * .8,
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
                                                Expanded(
                                                  child: Text(
                                                    " ${snapshot.data!.docs[index]["username"]}",
                                                    style: const TextStyle(color: Colors.white),
                                                  ),
                                                ),

                                                GestureDetector(
                                                    onTap: () {
                                                      showDialog(
                                                          context: context,
                                                          builder:
                                                              (context) =>
                                                              AlertDialog(
                                                                actions: [
                                                                  IconButton(
                                                                      onPressed:
                                                                          () async {
                                                                        if (formKey.currentState!.validate()) {
                                                                          // && imgName !=null && imgPath != null
                                                                          CollectionReference users = FirebaseFirestore.instance.collection('users');

                                                                          users.doc("${snapshot.data!.docs[index]["Email"]}").collection('number').add({
                                                                            'Number': doctorrController.text,
                                                                            'Waiting': hospitalController.text,
                                                                          });

                                                                          Navigator.of(context).pop();
                                                                        } else {
                                                                          showSnackBar(context, 'Error');
                                                                        }
                                                                      },
                                                                      icon:
                                                                      const Text(
                                                                        "Add ",
                                                                        style:
                                                                        TextStyle(color: Colors.blue),
                                                                      ))
                                                                ],
                                                                title:
                                                                Column(
                                                                  children: [
                                                                    Form(
                                                                      key:
                                                                      formKey,
                                                                      child:
                                                                      Column(
                                                                        children: [
                                                                          //1
                                                                          FromText(
                                                                            validator: (value) {
                                                                              if (value == null || value.isEmpty) {
                                                                                return 'Please enter some text';
                                                                              }
                                                                              return null;
                                                                            },
                                                                            controllerr: doctorrController,
                                                                            ispassword: false,
                                                                            TextInputTypeee: TextInputType.text,
                                                                            labelTextr: 'enter number',
                                                                            prefixIconT: Icons.drive_file_rename_outline,
                                                                            suffixIconn: IconButton(
                                                                                onPressed: () {},
                                                                                icon: const Icon(
                                                                                  Icons.visibility,
                                                                                  color: Colors.white,
                                                                                )),
                                                                          ),
                                                                          const SizedBox(
                                                                            height: 30,
                                                                          ),
                                                                          FromText(
                                                                            validator: (value) {
                                                                              if (value == null || value.isEmpty) {
                                                                                return 'Please enter some text';
                                                                              }
                                                                              return null;
                                                                            },
                                                                            controllerr: hospitalController,
                                                                            ispassword: false,
                                                                            TextInputTypeee: TextInputType.text,
                                                                            labelTextr: 'enter waiting',
                                                                            prefixIconT: Icons.local_hospital,
                                                                            suffixIconn: IconButton(
                                                                                onPressed: () {},
                                                                                icon: const Icon(
                                                                                  Icons.visibility,
                                                                                  color: Colors.white,
                                                                                )),
                                                                          ),
                                                                          const SizedBox(
                                                                            height: 30,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ));
                                                    },
                                                    child: Container(
                                                      height: 30,
                                                      width: 90

                                                      , decoration: BoxDecoration(
                                                        borderRadius: BorderRadiusDirectional.circular(10),
                                                        color: Colors.blue
                                                    )

                                                      ,child: const Center(
                                                      child: Text("Add Number ",
                                                          style: TextStyle(
                                                              color:
                                                              Colors.white)),
                                                    ),
                                                    )),

                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                // ******************************************************8888
                                                IconButton(
                                                    onPressed: () async {
                                                      await FirebaseFirestore
                                                          .instance
                                                          .collection('users')
                                                          .doc(
                                                          "${snapshot.data!.docs[index]["Email"]}")
                                                          .delete();
                                                      setState(() {});
                                                    },
                                                    icon: const Icon(
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
                                )
                              ),
                            );
                          },
                        ),
                      ],
                    ),
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


//  ${snapshot.data!.docs[index]["username"]}