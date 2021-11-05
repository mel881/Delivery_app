import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
import 'package:flutter/services.dart';
import 'dart:typed_data';
//signature class
class Signature extends StatefulWidget {
  const Signature({ Key? key }) : super(key: key);

  @override
  _SignatureState createState() => _SignatureState();
}

class _SignatureState extends State<Signature> {
  SignatureController control= SignatureController();
  
    @override

    void iniState(){

      super.initState();
      control= SignatureController();
    }
   @override

    void dispose(){
      control.dispose();
      super.dispose();
    }

     

       Widget buildButtons(BuildContext context) => Container(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //buildCheck(context),
            buildClear(),
          ],
        ),
      );

   Widget buildClear() => IconButton(
        iconSize: 36,
        icon: Icon(Icons.clear, color: Colors.red),
        onPressed: () => control.clear(),
      ); 


  @override
  Widget build(BuildContext context) => Scaffold( 
   
      body: Column(
        children:<Widget> [
              
          
                       
             buildButtons(context), 
              
        ],
      ),
    );
  

  
}

