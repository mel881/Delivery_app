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
    // of the TextField.
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
        title: Text("Mon Profil"),
      ),
      body: SingleChildScrollView(
          child: Center(
              child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(children: [
          Stack(children: [
            buildImageProfile1("images/avatar.png", 128, 128),
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
                    child: Icon(Icons.add_a_photo, color: Colors.white)),
              ),
              bottom: 0,
              right: 5,
            ),
          ]),
          const SizedBox(height: 30),
          Form(
              child: Column(
            children: [
              buildPreFormInput(const Icon(Icons.edit), "Nom", "John Doe",
                  false, context, nameController),
              const SizedBox(height: 30),
              buildPreFormInput(const Icon(Icons.edit), "Telephone",
                  "699999999", false, context, phoneController),
              const SizedBox(height: 30),
              buildPreFormInput(const Icon(Icons.edit), "Email",
                  "johnDo@gmail.com", false, context, mailController),
              const SizedBox(height: 30),
              buildPreFormInput(const Icon(Icons.edit), "Adresse", "Yaoundé",
                  false, context, adresseController),
              const SizedBox(height: 30),
              buildPreFormInput(const Icon(Icons.edit), "Mot de passe",
                  "John_Doe", true, context, passwordController),
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

Widget buildPreFormInput(Icon subIcon, String label, String defaultValue,
    bool obscur, BuildContext context, TextEditingController controller) {
  final _controller = TextEditingController(text: defaultValue);
  return TextFormField(
    obscureText: obscur,
    controller: _controller,
    decoration: InputDecoration(
      label: Text(label),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      suffixIcon: IconButton(onPressed: () {}, icon: subIcon),
    ),
  );
}

Widget buildImageProfile1(String pathImage, double height, double width) {
  final profile = AssetImage(pathImage);
  //final profile = NetworkImage(pathImage);
  return ClipOval(
    child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: profile,
          fit: BoxFit.cover,
          height: height,
          width: width,
          child: InkWell(onTap: () {}),
        )),
  );
}

Future<void> _displayTextInputDialog(
    BuildContext context, TextEditingController controller) async {
  return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            content: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                    label: Text("Nom"),
                    hintText: "Entrer le nouvelle nom  d'utilisateur",
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
