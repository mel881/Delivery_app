import 'package:flutter/material.dart';
import 'package:mel_app/Livreur.dart';
import 'package:mel_app/login.dart';

//import 'package:flutter_gen/gen_l10n/gall bery_localizations.dart';
void main() => runApp(client_test());

class client_test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const Login(),
        '/accueil': (context) => Home(),
      },
    );
  }
}
