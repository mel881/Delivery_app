import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'admin_app.dart';

class FixerPrix extends StatefulWidget {
  const FixerPrix({Key? key}) : super(key: key);

  @override
  _FixerPrixState createState() => _FixerPrixState();
}

class _FixerPrixState extends State<FixerPrix> {
  TextEditingController prixControl = TextEditingController();
  TextEditingController payerControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [Text("Fixer  le prix")],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage("images/photo.jpg"),
                        fit: BoxFit.fill,
                        alignment: Alignment.center,
                      )),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey,
                    )),
                padding: const EdgeInsets.all(22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    information("Nom", "Big Burger"),
                    information("Despcrition",
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In a neque facilisis felis tempus pretium. Pellentesque nec nulla vestibulum, consequat ligula ac, ultrices odio. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Pellentesque eget lectus at dolor vehicula tincidunt."),
                    information("Poids ", "1,5Kg"),
                    information("Encombrement ", "Petit"),
                    information("Région ", "Center"),
                    information("Ville ", "10 Kg"),
                    information("Lieu de Depart", "Accasia"),
                    information("Lieu d'arrivé", "Minboman"),
                    information("Livreur", ""),
                    information("Statut", "Postée"),
                    SizedBox(height: 30),
                    textFiel(
                        "Selectionner", "Payer", true, payerControl, false),
                    SizedBox(height: 30),
                    textFiel("Entrer le cout de la livraison", "Fixer le prix",
                        false, prixControl, false),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      },
                      child: Text(
                        "Valider",
                        textAlign: TextAlign.center,
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32))),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget information(String label, String value) {
  return RichText(
    text: TextSpan(
        style: const TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(
            text: label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const TextSpan(text: " : "),
          TextSpan(text: value, style: TextStyle(color: Colors.grey[800]))
        ]),
  );
}

// fonction pour generer les inputs
// fonction permettant de creer les inputs
Widget textFiel(String hintText, String label, bool select,
    TextEditingController control, bool photo) {
  String controller;
  var items = [
    'avant la livraison ',
    'Apres la livraison',
  ];

  return TextFormField(
    controller: control,
    decoration: InputDecoration(
      prefixIcon: photo ? Icon(Icons.add_a_photo) : null,
      suffixIcon: select
          ? PopupMenuButton<String>(
              icon: const Icon(Icons.arrow_drop_down),
              onSelected: (String value) {
                control.text = value;
              },
              itemBuilder: (BuildContext context) {
                return items.map<PopupMenuItem<String>>((String value) {
                  return new PopupMenuItem(
                      child: new Text(value), value: value);
                }).toList();
              },
            )
          : null,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(23)),
      labelText: label,
      hintText: hintText,
    ),
    // The validator receives the text that the user has entered.
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    },
  );
}
