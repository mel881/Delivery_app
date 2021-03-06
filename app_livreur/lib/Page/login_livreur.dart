import 'package:app_livreur/widget/buildwidget.dart';
import 'package:flutter/material.dart';
import 'livreur_accueil.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final _nameController = TextEditingController();

    final _passwordController = TextEditingController();

    @override
    void initState() {
      super.initState();
    }

    @override
    void dispose() {
      _nameController.dispose();
      _passwordController.dispose();

      super.dispose();
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(180),
        child: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Center(
            child: Text(
              "Delivery-App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(170),
            ),
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                const Text(
                  "Connectez-vous",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                input_field("Nom  d'utilisateur", "Entrez votre nom ", false,
                    const Icon(Icons.account_circle), _nameController),
                const SizedBox(height: 16),
                input_field("Mot de passe", "Entrez votre mot de passe", true,
                    const Icon(Icons.lock), _passwordController),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Mot de passe oubli???",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.deepPurple,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Accueil()),
                    );
                  },
                  child: const Text(
                    "Connexion",
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// fonction pour generer les inputs
