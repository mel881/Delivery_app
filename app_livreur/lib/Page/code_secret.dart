import 'package:app_livreur/widget/buildwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app_livreur/Page/livreur_accueil.dart';

import 'choix_livraison.dart';

class CodeSecret extends StatefulWidget {
  const CodeSecret({Key? key}) : super(key: key);

  @override
  _CodeSecretState createState() => _CodeSecretState();
}

class _CodeSecretState extends State<CodeSecret> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(" Code Secret")),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(30),
        child: Center(
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        information("Nom de la Livraison ", "Big Burger"),
                        const SizedBox(
                          height: 10,
                          width: 20,
                        ),
                        information("Fournisseur ", "John doe"),
                        const SizedBox(
                          height: 10,
                          width: 20,
                        ),
                        information("Recepteur", "   Jane Doe "),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                      width: 20,
                    ),
                    TextFormField(
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Entrer le  code ";
                        }
                        if (value.length < 5 || value.length > 5) {
                          return "5 caractere sont attendue";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          labelText: "code secret",
                          hintText: "enter le code secret"),
                    ),
                    const SizedBox(
                      height: 40,
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                   
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Accueil()));
               
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Traitement de la demande')),
                          );
                         
                        }
                      },
                      child: const Text(
                        "Valider",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ))),
      )),
    );
  }
}
