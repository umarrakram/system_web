




import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeDesign extends StatelessWidget {
 String img;
 String text;


    HomeDesign({super.key, 
      required this.img,
      required this.text


    });

  @override
  Widget build(BuildContext context) {

    return   Column(
      children: [
        Stack(
          children: [
            Container(
              width: 100,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade300,
              ),
            ),
            SvgPicture.asset(height: 100,
              width: 70,
              img,
              // color: Colors.red[400],
              fit: BoxFit.cover,
            ),
          ],
        ),
        Text(text,)
      ],
    )
    ;
  }
}