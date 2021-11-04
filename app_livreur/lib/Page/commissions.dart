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

Widget createListLivraison() {
  return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 12,
      padding: EdgeInsets.all(10),
      itemBuilder: (BuildContext context, int index) {
        return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 2,
            child: ListTile(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailLivrasion())),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              contentPadding: const EdgeInsets.only(
                  left: 10, right: 5, top: 15, bottom: 15),
              title: const Text("Big Burger"),
              trailing: Wrap(
                direction: Axis.vertical,
                children: const <Widget>[
                  Text('Prix:1000Fcfa'),
                  Text("votre commission: 500Fcfa")
                ],
              ),
            ));
      });
}
