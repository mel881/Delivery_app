import 'package:flutter/material.dart';
import 'profile.dart';

class ProfilLivreur extends StatefulWidget {
  const ProfilLivreur({Key? key}) : super(key: key);

  @override
  _ProfilLivreurState createState() => _ProfilLivreurState();
}

class _ProfilLivreurState extends State<ProfilLivreur> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("John Doe"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(children: [
              buildImageProfile1("images/avatar.png", 128, 128),
              const SizedBox(height: 32),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  information("Nom", "John Doe"),
                  const SizedBox(height: 16),
                  information("Telephone", "693457624"),
                  const SizedBox(height: 16),
                  information("Email", "JohnDoe@gmail.com"),
                  const SizedBox(height: 16),
                  information("Adresse", "Acacias"),
                ],
              ),
            ]),
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
