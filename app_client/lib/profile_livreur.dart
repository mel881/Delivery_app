import'package:flutter/material.dart';
import 'profile.dart';
class ProfilLivreur extends StatefulWidget {
  const ProfilLivreur({ Key? key }) : super(key: key);

  @override
  _ProfilLivreurState createState() => _ProfilLivreurState();
}

class _ProfilLivreurState extends State<ProfilLivreur> {
  @override
  Widget build(BuildContext context) {
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
          information("Nom","John Doe"),
          const SizedBox(height:10),
           information("Telephone","693457624"),
           const SizedBox(height:10),
            information("Email","JohnDoe@gmail.com"),
            const SizedBox(height:10),
             information("Adresse","Acacias"),
         ] )
         ,),
         ),
    ),
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