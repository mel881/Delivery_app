import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
                      maxLength: 5,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Entrer le  code ";
                        }
                        if (value.length <= 5) {
                          return "5 caractere sont attendue";
                        } else {
                          return null;
                        }
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
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
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
