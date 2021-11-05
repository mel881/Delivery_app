import 'package:app_livreur/Page/choix_livraison.dart';
import 'package:app_livreur/Page/code_secret.dart';
import 'package:app_livreur/Page/details_commissions.dart';
import 'package:flutter/material.dart';

Widget createListTabs() {
  /*Ce widget permet de creer  un liste de livrason posté.
  avec les données on passe juste en paramtre la variables constant  les livraisons
   */
  return ListView.builder(
      itemCount: 5, // donné.lenght
      itemBuilder: (BuildContext context,
          int index) /* index nous permet d'itterer sur les differentes valeur de notre variable */ {
        return ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ChoixLivrasion()));
          },
          trailing: Wrap(
            children: <Widget>[const Text("il y'as 2 min")],
          ),
          title: const Text('BIG Burgur'), // donné[index].nom
          subtitle: const Text('Prix : 2500 Fcfa'), //donné[index].prix
        );
      });
}

Widget createListTabs2() {
  /*Ce widget permet de creer  un liste de livrason encours.
  avec les données on passe juste en paramtre la variables constant  les livraisons
   */
  return ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          trailing: Wrap(
            spacing: 12, // space between two icons
            children: <Widget>[
              ElevatedButton(
                // ouverture de la fenetre popup
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Alert'),
                    content: const Text(
                        'Voulez vous  vraiment annuler cette livrasion ?'),
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
                  ),
                ),
                child: Text(
                  "Annuler",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.red.shade700,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(10, 30),
                    primary: Colors.red.shade200,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32))),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CodeSecret()));
                },
                child: Text(
                  "Terminer",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.green.shade700,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(10, 30),
                    primary: Colors.green.shade200,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32))),
              ),
            ],
          ),
          title: const Text('BIG Burgur'), //data[index].nom
          subtitle:
              const Text('Created on 20 oct 2021'), //data[index].created_on
        );
      });
}

Widget createListTabs3() {
  /*Ce widget permet de creer  un liste de livrason terminées.
  avec les données on passe juste en paramtre la variables constant  les livraisons
   */
  return ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          trailing: Wrap(
            spacing: 12, // space between two icons
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DetailLivrasion()));
                },
                child: Text(
                  "Details",
                  style: TextStyle(
                    color: Colors.yellow.shade700,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.yellow.shade100,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32))),
              ),
            ],
          ),
          title: Text('BIG Burgur'),
          subtitle: Text('Terminate on 20 oct2021'),
        );
      });
}

Widget information(String label, String value) {
  /* ce widget me permet de creer des text  du type
  "label : value"

   */
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

Widget input_field(String labelText, String hintText, bool obscur, Icon icon,
    TextEditingController controller) {
  return Container(
    child: TextFormField(
      controller: controller,
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

Widget createListLivraison() {
  /* cette fonction  permet  de creer une liste de livrasion  terminées */
  return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 12,
      padding: EdgeInsets.all(10),
      itemBuilder: (BuildContext context, int index) {
        return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 2,
            child: ListTile(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailLivrasion())),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              contentPadding: const EdgeInsets.only(
                  left: 10, right: 5, top: 15, bottom: 15),
              title: const Text("Big Burger"),
              trailing: Wrap(
                direction: Axis.vertical,
                children: const <Widget>[
                  Text('Prix:1000Fcfa'),
                  Text("votre commission: 500Fcfa")
                ],
              ),
            ));
      });
}

Widget BuildExpansionTileText(Icon icon, String titre, String contenue) {
  /* ce widget me permet de creer  des expansiontile avec des icons  de mon choix  */
  return ExpansionTile(leading: icon, title: Text(titre), children: [
    const SizedBox(
      height: 10,
    ),
    Text(contenue),
    const SizedBox(
      height: 30,
    ),
  ]);
}

Widget buildImageProfile(String pathImage, double height, double width) {
  /* Permet de creer une image ronde avec la hauteur et la larger qu'on veut */
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
