import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({super.key});

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {

  List users = [];
  //CollectionReference
  CollectionReference usersref = FirebaseFirestore.instance
      .collection('users')
      .doc("${FirebaseAuth.instance.currentUser!.email}")
      .collection('number');

  GetData() async {
    var response = await usersref.get();
    // 1 doc
    //setState(() {
    // users.add(response.data());
    //  });

    //all doc
    for (var element in response.docs) {
      setState(() {
        users.add(element.data());
      });
    }
  }

  @override
  void initState() {
    GetData();
    super.initState();
  }
//************************************************************

  final Stream<QuerySnapshot> usersStream = FirebaseFirestore.instance
      .collection('users')
      .doc("${FirebaseAuth.instance.currentUser!.email}")
      .collection('number')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      child: Opacity(
                        opacity: .8,
                        child: Center(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.4,
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(6)),
                            child: SizedBox(
                              height: 50,
                              child: StreamBuilder<QuerySnapshot>(
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

                                  return Padding(
                                    padding: const EdgeInsets.all(60.0),
                                    child: ListView.builder(
                                      itemCount: 1,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Your Number : ${snapshot.data!.docs.isEmpty? "1":"${snapshot.data!.docs[index]["Number"]}"}",
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blue),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              "Wait for ${snapshot.data!.docs.isEmpty? "0":"${snapshot.data!.docs[index]["Waiting"]}"} people",
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blue),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Center(
                      child: Text(
                        "Thanks for waiting.",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(

                      onTap: () async{

                          await FirebaseAuth.instance.signOut();
                      Navigator.pop(context);

                      },
                      child: const Center(
                        child: Text(
                          "Log out ",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
