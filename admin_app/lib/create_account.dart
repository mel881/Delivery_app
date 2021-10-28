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
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Center(
          child: Text(
            "Delivery-App",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
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
                  "Creez un compte",
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
                input_field("Telephone", "Entrez votre numero de telephone",
                    false, const Icon(Icons.phone)),
                const SizedBox(height: 16),
                input_field("Adresse", "Entrez votre adresse", false,
                    const Icon(Icons.location_city)),
                const SizedBox(height: 16),
                input_field("Mot de passe", "Entrez votre mot de passe", true,
                    const Icon(Icons.lock)),
                const SizedBox(height: 16),
                input_field("Mot de passe", "Confirmée votre mot de passe",
                    true, const Icon(Icons.lock)),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "Creez",
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
