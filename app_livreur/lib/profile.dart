import 'package:app_livreur/login_livreur.dart';
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

    @override
    void initState() {
      super.initState();
    }

    @override
    void dispose() {
      nameController.dispose();
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
            buildImageProfile(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLUZMi9_GJHcCPe7UH0sF1_bhy-NUTTborXg&usqp=CA"),
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
              buildPreFormInput(Icon(Icons.edit), "Nom", "John Doe", false,
                  context, nameController)
            ],
          ))
        ]),
      ))),
    );
  }
}

Widget buildPreFormInput(Icon subIcon, String label, String defaultValue,
    bool obscur, BuildContext context, TextEditingController controller) {
  return TextFormField(
    obscureText: obscur,
    //controller: controller,
    initialValue: controller.text.isEmpty ? "" : controller.text,
    decoration: InputDecoration(
      label: Text(label),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      suffixIcon: IconButton(
          onPressed: () {
            _displayTextInputDialog(context, controller);
          },
          icon: subIcon),
    ),
  );
}

Widget input_field(String labelText, String hintText, bool obscur) {
  return Container(
    child: TextFormField(
      obscureText: obscur,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
        labelText: labelText,
        hintText: hintText,
        //prefixIcon: icon,
      ),
    ),
  );
}

Widget buildImageProfile(String pathImage) {
  //final profile = AssetImage(pathImage);
  final profile = NetworkImage(pathImage);
  return ClipOval(
    child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: profile,
          fit: BoxFit.cover,
          height: 128,
          width: 128,
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
                onPressed: () => Navigator.pop(context, 'Oui'),
                child: const Text(
                  'Oui',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ));
}
