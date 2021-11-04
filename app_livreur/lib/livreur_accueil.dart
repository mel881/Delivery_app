import 'package:app_livreur/aide.dart';
import 'package:app_livreur/choix_livraison.dart';
import 'package:app_livreur/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login_livreur.dart';
import 'commissions.dart';
import 'details_commissions.dart';
import 'code_secret.dart';
import 'profile.dart';

class Accueil extends StatefulWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  _AccueilState createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  @override
  final List<String> list = List.generate(10, (index) => "Livraison $index");
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            title: const Text(
              'Delivery App',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            actions: <Widget>[
              IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
              IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: Search(list));
                },
                icon: const Icon(Icons.search),
              ),
            ],
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(
                  child: Text(
                    "Livraisons Postées ",
                    style: TextStyle(fontSize: 11),
                  ),
                ),
                Tab(
                  child: Text(
                    "Livraisons En Cours",
                    style: TextStyle(fontSize: 11),
                  ),
                ),
                Tab(
                  child: Text(
                    "Livraisons Terminées",
                    style: TextStyle(fontSize: 11),
                  ),
                )
              ],
            ),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.deepPurple,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Profile()),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                buildImageProfile("images/avatar.png", 90, 96),
                                Text("John Doe",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 26,
                                    ))
                              ],
                            )),
                      ]),
                ),
                ListTile(
                    leading: const Icon(Icons.money),
                    title: const Text('Mes commisions'),
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Commission()))),
                ListTile(
                    leading: const Icon(Icons.help),
                    title: const Text('Aide'),
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Aide()))),
                ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('Deconnexion'),
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login())))
              ],
            ),
          ),
          body: TabBarView(children: <Widget>[
            Center(child: createListTabs()),
            Center(child: createListTabs2()),
            Center(child: createListTabs3()),
          ])),
    );
  }
}

Widget createListTabs() {
  return ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ChoixLivrasion()));
          },
          trailing: Wrap(
            spacing: 12, // space between two icons
            children: <Widget>[Text("il y'as 2 min")],
          ),
          title: Text('BIG Burgur'),
          subtitle: Text('Prix : 2500 Fcfa'),
        );
      });
}

Widget createListTabs2() {
  return ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          trailing: Wrap(
            spacing: 12, // space between two icons
            children: <Widget>[
              ElevatedButton(
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
          title: Text('BIG Burgur'),
          subtitle: Text('Created on 20 oct 2021'),
        );
      });
}

Widget createListTabs3() {
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
                          builder: (context) => DetailLivrasion()));
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

//search fonction

class Search extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  String selectedResult = "";

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
        child: Text(selectedResult),
      ),
    );
  }

  final List<String> listExample;
  Search(this.listExample);

  List<String> recentList = ["Livraison 4", "Livraison 3"];

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestionList = [];
    query.isEmpty
        ? suggestionList = recentList //In the true case
        : suggestionList.addAll(listExample.where(
            // In the false case
            (element) => element.contains(query),
          ));

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            suggestionList[index],
          ),
          leading: query.isEmpty ? Icon(Icons.access_time) : SizedBox(),
          onTap: () {
            selectedResult = suggestionList[index];
            showResults(context);
          },
        );
      },
    );
  }
}
