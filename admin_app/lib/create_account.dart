import 'package:flutter/material.dart';


class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
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
                    const Icon(Icons.account_circle)),
                const SizedBox(height: 16),
                input_field("Email", "Entrez adresse votre adresse mail", false,
                    const Icon(Icons.email)),
                const SizedBox(height: 16),
                input_field("Telephone", "Entrez votre numero de telephone", false,
                    const Icon(Icons.phone)),
                const SizedBox(height: 16),
                input_field("Mot de passe", "Entrez votre mot de passe", true,
                    const Icon(Icons.lock)),
                const SizedBox(height: 16),
                input_field("Mot de passe", "Entrez votre mot de passe", true,
                    const Icon(Icons.lock)),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Mot de passe oublié?",
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
                      MaterialPageRoute(builder: (context) => Accueil()),
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
Widget input_field(String labelText, String hintText, bool obscur, Icon icon) {
  return Container(
    child: TextFormField(
      obscureText: obscur,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
        labelText: labelText,
        hintText: hintText,
        prefixIcon: icon,
      ),
    ),
  );
}
