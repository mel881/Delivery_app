import 'package:flutter/material.dart';

class Aide extends StatefulWidget {
  const Aide({Key? key}) : super(key: key);

  @override
  _AideState createState() => _AideState();
}

class _AideState extends State<Aide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aide"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Center(
            child: Column(children: [
              Text(
                " Besion d'aide pour utiliser notre application ?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              BuildExpansionTileList(Icon(Icons.place),
                  "Comment obtenir ces Coordonner Geographique", [
                ListTile(
                  leading: Icon(Icons.chevron_right, size: 32),
                  title: Text(
                    "Ouvrir Google map",
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.chevron_right, size: 32),
                  title: Text(
                    "Appuyer et  maintener votre doigt sur la position souhaité",
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.chevron_right, size: 32),
                  title: Text(
                    "les Coordonnée s'affiche dans la barre de recherche en haut",
                  ),
                ),
              ]),
              BuildExpansionTileText(
                  const Icon(Icons.create),
                  "Creer une Livraison",
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. "),
              BuildExpansionTileText(
                  const Icon(Icons.money_rounded),
                  "Payer une Livraison",
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. "),
              BuildExpansionTileText(
                  const Icon(Icons.car_rental),
                  "Terminer une Livraison",
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. "),
              BuildExpansionTileText(
                  const Icon(Icons.delete),
                  "Supprimer une Livraison",
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. "),
              SizedBox(
                height: 15,
              ),
              const ExpansionTile(
                title: Text("Creation  de compte"),
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. "),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

Widget BuildExpansionTileText(Icon icon, String titre, String contenue) {
  return ExpansionTile(leading: icon, title: Text(titre), children: [
    const SizedBox(
      height: 10,
    ),
    Text(contenue),
    const SizedBox(
      height: 30,
    ),
  ]);
}

Widget BuildExpansionTileList(Icon icon, String titre, List<Widget> children) {
  return ExpansionTile(leading: icon, title: Text(titre), children: children);
}
