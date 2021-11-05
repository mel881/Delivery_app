import 'package:app_livreur/widget/buildwidget.dart';
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
          padding: const EdgeInsets.all(12),
          child: Center(
            child: Column(children: [
              const Text(
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
              const SizedBox(
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
