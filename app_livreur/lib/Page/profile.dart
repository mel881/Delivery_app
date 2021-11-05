import 'package:app_livreur/Page/login_livreur.dart';
import 'package:app_livreur/widget/buildwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    // contreoller des TextFormField.
    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    final mailController = TextEditingController();
    final adresseController = TextEditingController();
    final passwordController = TextEditingController();

    @override
    void initState() {
      super.initState();
    }

    @override
    void dispose() {
      nameController.dispose();
      phoneController.dispose();
      mailController.dispose();
      adresseController.dispose();
      passwordController.dispose();

      super.dispose();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mon Profil"),
      ),
      body: SingleChildScrollView(
          child: Center(
              child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(children: [
          Stack(children: [
            buildImageProfile("images/avatar.png", 128, 128),
            Positioned(
              child: ClipOval(
                child: Container(
                    padding: const EdgeInsets.all(5),
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      border: Border.all(
                        color: Colors.white,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Icon(Icons.add_a_photo, color: Colors.white)),
              ),
              bottom: 0,
              right: 5,
            ),
          ]),
          const SizedBox(height: 30),
          Form(
              child: Column(
            children: [
              buildPreFormInput(
                  const Icon(Icons.edit),
                  "Nom",
                  "John Doe",
                  false,
                  context,
                  nameController,
                  "Entrer  le nom d'utilisateur"),
              const SizedBox(height: 30),
              buildPreFormInput(
                  const Icon(Icons.edit),
                  "Telephone",
                  "699999999",
                  false,
                  context,
                  phoneController,
                  "Entrer votre numero  de telephone"),
              const SizedBox(height: 30),
              buildPreFormInput(
                  const Icon(Icons.edit),
                  "Email",
                  "johnDoe@gmail.com",
                  false,
                  context,
                  mailController,
                  "Entrer votre adreesse mail"),
              const SizedBox(height: 30),
              buildPreFormInput(const Icon(Icons.edit), "Adresse", "Yaoundé",
                  false, context, adresseController, "Entrer votre adreesse"),
              const SizedBox(height: 30),
              buildPreFormInput(
                  const Icon(Icons.edit),
                  "Mot de passe",
                  "John_Doe",
                  true,
                  context,
                  passwordController,
                  "Enter votre mot de passe "),
              const SizedBox(height: 30),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, 'Annuler');
                  },
                  child: const Text("Valider"))
            ],
          ))
        ]),
      ))),
    );
  }
}

Widget buildPreFormInput(
    Icon subIcon,
    String label,
    String defaultValue,
    bool obscur,
    BuildContext context,
    TextEditingController controller,
    String hinttext) {
  final _controller = TextEditingController(text: defaultValue);
  return TextFormField(
    obscureText: obscur,
    controller: _controller,
    decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        suffixIcon: IconButton(onPressed: () {}, icon: subIcon)),
  );
}

Future<void> _displayTextInputDialog(BuildContext context,
    TextEditingController controller, String name, String hinttext) async {
  return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: Text(name),
            content: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                    labelText: name,
                    hintText: hinttext,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)))),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Annuler'),
                child: const Text(
                  'Annuler',
                  style: TextStyle(color: Colors.green),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, 'Oui');
                },
                child: const Text(
                  'Oui',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ));
}
