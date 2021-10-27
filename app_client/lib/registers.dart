import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(192),
        child: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Center(
            child: Text(
              "Delivery-App",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 36,
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
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height: 8),
                const Text(
                  "Inscription",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32)),
                      labelText: "Nom  d'utilisateur",
                      hintText: "Entrer votre nom d'utilisateur",
                      prefixIcon: const Icon(Icons.account_circle, size: 32),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32)),
                      labelText: "Email",
                      hintText: "Entrer votre adresse email",
                      prefixIcon: const Icon(Icons.email, size: 32),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32)),
                      labelText: "Telephone",
                      hintText: "Entrer votre numero  de telephone",
                      prefixIcon: const Icon(Icons.phone, size: 32),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32)),
                      labelText: "Adresse",
                      hintText: "Entrer votre adresse",
                      prefixIcon: const Icon(Icons.location_city, size: 32),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32)),
                        labelText: "Mot de passe",
                        prefixIcon: const Icon(
                          Icons.lock,
                        ),
                        hintText: "Entre votre mot de passe",
                        focusColor: Colors.deepPurple,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32),
                            borderSide:
                                const BorderSide(color: Colors.deepPurple))),
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32)),
                        labelText: "Mot de passe",
                        prefixIcon: const Icon(
                          Icons.lock,
                        ),
                        hintText: "confimer votre mot de passe",
                        focusColor: Colors.deepPurple,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32),
                            borderSide:
                                const BorderSide(color: Colors.deepPurple))),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  onPressed: () {
                    
                  },
                  child: const Text(
                    "Creez",
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Avez-vous un compte?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Connectez-Vous!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.deepPurple,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
