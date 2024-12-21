



 import 'package:flutter/material.dart';

import 'color.dart';

class FromText extends StatelessWidget {
  final TextInputType TextInputTypeee;
  final bool ispassword;
  final String labelTextr;
  final  IconData prefixIconT ;
  final dynamic controllerr;
   final dynamic validator;
  final dynamic autovalidateMode;
  final   Widget suffixIconn ;
     var onChangedd ;

  FromText( {
    super.key,
     required this.TextInputTypeee,
  required this.ispassword,
  required this.labelTextr, required this.prefixIconT, this.controllerr,this.validator,this.autovalidateMode,
     required this.suffixIconn,this.onChangedd


  } );

  @override
  Widget build(BuildContext context) {
    return
      TextFormField(
      autovalidateMode:autovalidateMode ,
      onChanged: onChangedd,
      //  mount char maxLength:3,


      validator: validator,
      controller:controllerr,

      keyboardType: TextInputTypeee,
      obscureText:ispassword,
      decoration: InputDecoration(focusColor: blue,
          //////////////////////////////////////////////////////////////////////
          //حجم TextFormField
          isDense: true,
          contentPadding: const EdgeInsets.all(18),

          //////////////////////////////////////////////////////////////////////
          labelStyle: const TextStyle(

              fontSize:13,
               ),
          labelText: labelTextr,

          prefixIcon:Icon(prefixIconT,color: Colors.black45,) ,

           suffixIcon: suffixIconn ,

          // to delete bordwes
          enabledBorder: OutlineInputBorder(
            
              borderSide: const BorderSide(
                  style: BorderStyle.solid, color: Colors.black26,),

          borderRadius: BorderRadius.circular(15),
          ),errorBorder: OutlineInputBorder(borderSide: const BorderSide(
            style: BorderStyle.solid, color: Colors.red,),borderRadius: BorderRadius.circular(15)),
          focusedBorder: OutlineInputBorder(
             borderSide: const BorderSide(color: blue,),
              borderRadius: BorderRadius.circular(15),

          ),focusedErrorBorder: OutlineInputBorder(borderSide: const BorderSide(
              style: BorderStyle.solid, color: Colors.red),borderRadius: BorderRadius.circular(15),),
          fillColor: Colors.white,
          filled: true),
          );
  }
}







class FromText2 extends StatelessWidget {
  final TextInputType TextInputTypeee;
  final bool ispassword;


  final dynamic controllerr;
  final dynamic validator;
  final dynamic prefixIconn;
  final dynamic autovalidateMode;
   var onChangedd ;

  FromText2( {
    super.key,
    required this.TextInputTypeee,
    required this.ispassword,
       this.controllerr,this.validator,this.autovalidateMode
    ,this.onChangedd,  required this.prefixIconn


  } );

  @override
  Widget build(BuildContext context) {
    return
      TextFormField(
        autovalidateMode:autovalidateMode ,
        onChanged: onChangedd,
        //  mount char maxLength:3,


        validator: validator,
        controller:controllerr,

        keyboardType: TextInputTypeee,
        obscureText:ispassword,
        decoration: InputDecoration(




            prefixIcon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(prefixIconn,style: const TextStyle(color: Colors.blue,fontSize: 25,fontWeight: FontWeight.bold)),
              ],
            ) ,


            // to delete bordwes
            enabledBorder:  UnderlineInputBorder(
                borderSide: const BorderSide(
                    style: BorderStyle.solid, color: Colors.black26),

                borderRadius: BorderRadius.circular(0)
            ),
             focusedBorder:   const UnderlineInputBorder(borderSide: BorderSide(color: Colors.black26)),
             fillColor: Colors.white54,
            filled: true),
      );
  }
}