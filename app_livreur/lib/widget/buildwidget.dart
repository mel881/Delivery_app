import 'package:app_livreur/Page/choix_livraison.dart';
import 'package:app_livreur/Page/code_secret.dart';
import 'package:app_livreur/Page/details_commissions.dart';
import 'package:flutter/material.dart';

Widget createListTabs() {
  /*Ce wi */
  return ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ChoixLivrasion()));
          },
          trailing: Wrap(
            spacing: 12, // space between two icons
            children: <Widget>[Text("il y'as 2 min")],
          ),
          title: Text('BIG Burgur'),
          subtitle: Text('Prix : 2500 Fcfa'),
        );
      });
}

Widget createListTabs2() {
  return ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          trailing: Wrap(
            spacing: 12, // space between two icons
            children: <Widget>[
              ElevatedButton(
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Alert'),
                    content: const Text(
                        'Voulez vous  vraiment annuler cette livrasion ?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Annuler'),
                        child: const Text(
                          'Annuler',
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Oui'),
                        child: const Text(
                          'Oui',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
                child: Text(
                  "Annuler",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.red.shade700,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(10, 30),
                    primary: Colors.red.shade200,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32))),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CodeSecret()));
                },
                child: Text(
                  "Terminer",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.green.shade700,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(10, 30),
                    primary: Colors.green.shade200,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32))),
              ),
            ],
          ),
          title: Text('BIG Burgur'),
          subtitle: Text('Created on 20 oct 2021'),
        );
      });
}

Widget createListTabs3() {
  return ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          trailing: Wrap(
            spacing: 12, // space between two icons
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailLivrasion()));
                },
                child: Text(
                  "Details",
                  style: TextStyle(
                    color: Colors.yellow.shade700,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.yellow.shade100,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32))),
              ),
            ],
          ),
          title: Text('BIG Burgur'),
          subtitle: Text('Terminate on 20 oct2021'),
        );
      });
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
