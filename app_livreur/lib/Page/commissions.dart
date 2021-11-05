import 'package:app_livreur/widget/buildwidget.dart';
import 'package:flutter/material.dart';
import 'details_commissions.dart';

class Commission extends StatefulWidget {
  const Commission({Key? key}) : super(key: key);

  @override
  _CommissionState createState() => _CommissionState();
}

class _CommissionState extends State<Commission> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Mes Commissions"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 120,
                width: 200,
                child: Card(
                    //color: Colors.deepPurple,
                    elevation: 5,
                    margin: EdgeInsets.all(10),
                    child: const ListTile(
                      title: Text(
                        " Total \n"
                        '30000Fcfa',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.black,
                          //color: Colors.white
                        ),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              createListLivraison()
            ],
          ),
        ));
  }
}
