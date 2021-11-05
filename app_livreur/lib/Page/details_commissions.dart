import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:app_livreur/widget/buildwidget.dart';

class DetailLivrasion extends StatefulWidget {
  const DetailLivrasion({Key? key}) : super(key: key);

  @override
  _DetailLivrasionState createState() => _DetailLivrasionState();
}

class _DetailLivrasionState extends State<DetailLivrasion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [Text("Details")],
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
                    information("Coût", "1000 Fcfa"),
                    information("Despcrition",
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In a neque facilisis felis tempus pretium. Pellentesque nec nulla vestibulum, consequat ligula ac, ultrices odio. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Pellentesque eget lectus at dolor vehicula tincidunt."),
                    information("Poids ", "1,5Kg"),
                    information("Encombrement ", "Petit"),
                    information("Région ", "Center"),
                    information("Ville ", "10 Kg"),
                    information("Lieu de Depart", "Accasia"),
                    information("Lieu d'arrivé", "Minboman"),
                    information("Livreur", "John Doe"),
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
