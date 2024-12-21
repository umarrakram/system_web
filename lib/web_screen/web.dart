import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:system_web/screen/screen1.dart';

class HomeWeb extends StatelessWidget {
  const HomeWeb({super.key});

  @override
  Widget build(BuildContext context) {
    final Screenwidth = MediaQuery.of(context).size.width;
    final Screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: Screenheight * .5,
              decoration: const BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_AjVXtSWwW5TbccwnuUfpqg29eh2KS7nmCg&s"),
                      fit: BoxFit.fill)),
              child: Center(
                  child: Text(
                "Medical History Record",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
            ),
            SizedBox(
              height: Screenheight * .1 * .3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ******************************************
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
                    );
                  },
                  child: Container(
                    width: Screenwidth * .2,
                    height: 196,
                    color: Colors.black,
                    child: Column(
                      children: [
                        Container(
                          width: Screenwidth * .2,
                          height: 150,
                          decoration: const BoxDecoration(
                              color: Colors.blue,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCp_ByMCZW8m0s3KmAbIENDvR2Zc_HkBJyYw&s"),
                                  fit: BoxFit.fill)),
                        ),
                        Container(
                          width: double.infinity,
                          height: 22,
                          color: Colors.white,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text("Admin")],
                          ),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "View",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: Screenwidth * .1 * .2,
                ),
                //********************************************8
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
                    );
                  },
                  child: Container(
                    width: Screenwidth * .2,
                    height: 196,
                    color: Colors.black,
                    child: Column(
                      children: [
                        Container(
                          width: Screenwidth * .2,
                          height: 150,
                          decoration: const BoxDecoration(
                              color: Colors.blue,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZvUWxZQoeEVCtJeS9YY8wwMCxwMtdPYkl1g&s"),
                                  fit: BoxFit.fill)),
                        ),
                        Container(
                          width: double.infinity,
                          height: 22,
                          color: Colors.white,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text("Doctor")],
                          ),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "View",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
