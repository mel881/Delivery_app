import 'package:admin_app/localisation.dart';
import 'package:admin_app/profil_admin.dart';
import 'package:flutter/material.dart';
import 'create_account.dart';
import 'login_admin.dart';
import 'create_livraison.dart';
import 'profile.dart';
import 'details.dart';
import 'aide.dart';
import 'compte_livreur.dart';
import 'fixer_prix.dart';

class Admin_app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => Login(),
        }
        //home: Login(),
        );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

final List<String> list = List.generate(10, (index) => "Livraison $index");
List<String> stat = [
  "encours",
  "postée",
  "terminée",
  "En attente",
  "fixer le prix",
  "encours",
  "postée",
  "terminée",
  "En attente",
  "fixer le prix"
];
List<bool> status = [
  false,
  true,
  false,
  true,
  false,
  false,
  true,
  false,
  true,
  false,
  false,
  true,
  false
];

class _HomeState extends State<Home> {
  @override
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
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: Search(list));
              },
              icon: Icon(Icons.search),
            )
          ],
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                child: Text(
                  "Livraisons",
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Tab(
                child: Text(
                  "Espace livreurs",
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Tab(
                child: Text(
                  "Espace clients",
                  style: TextStyle(fontSize: 12),
                ),
              ),
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
                              buildImageProfile1("images/avatar.png", 90, 96),
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
                leading: Icon(Icons.account_circle),
                title: Text('Creer Un Compte Admin'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateAccount()),
                ),
              ),
              ListTile(
                leading: Icon(Icons.help),
                title: Text('Aide'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Aide()),
                ),
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Deconnexion'),
                onTap: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: livraison(stat, context),
            ),
            Center(
              child: compte(status, context),
            ),
            Center(
              child: compte(status, context),
            ),
          ],
        ),
      ),
    );
  }
}

// fonction pour les comptes livreur et admin
Widget compte(List<bool> status, context) {
  return Scaffold(
    body: ListView.builder(
        itemCount: status.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
            },
            leading: Icon(
              Icons.account_circle,
              size: 40,
            ),

            trailing: status[index]
                ? OutlinedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32))),
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Alert'),
                        content: const Text(
                            'Voulez vous  vraiment reactiver ce compte ?'),
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
                    child: Text("activé"),
                  )
                : Wrap(
                    spacing: 12, // space between two icons
                    children: <Widget>[
                      OutlinedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32))),
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Alert'),
                            content: const Text(
                                'Voulez vous  vraiment desactiver ce compte ?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Annuler'),
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
                        child: Text("desactivé"),
                      )
                    ],
                  ),

            title: const Text('John Doe'),
            // subtitle: Text('Created on 20 oct2021'),
          );
        }),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CompteLivreur()),
        );
        // Add your onPressed code here!
      },
      child: const Icon(Icons.add),
      backgroundColor: Colors.deepPurple,
    ),
  );
}

// Livraison;
Widget livraison(List<String> stat, context) {
  return Scaffold(
    body: ListView.builder(
        itemCount: stat.length,
        itemBuilder: (BuildContext context, int index) {
          if (stat[index] == "fixer le prix") {
            return ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FixerPrix()),
                );
              },
              trailing: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FixerPrix()),
                  );
                  print('Received click');
                },
                child: Text(stat[index]),
              ),
              title: Text('BIG Burgur'),
              subtitle: Text('Created on 20 oct2021'),
            );
          } else if (stat[index] == "encours") {
            return ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailLivrasion()),
                );
              },
              trailing: Wrap(
                verticalDirection: VerticalDirection.up,
                children: <Widget>[
                  Text(stat[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      )),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => mappPage()),
                      );
                      print('Received click');
                    },
                    icon: Icon(
                      Icons.place,
                      color: Colors.grey,
                      size: 36,
                    ),
                  ),
                ],
              ),
              title: Text('BIG Burgur'),
              subtitle: Text('Created on 20 oct2021'),
            );
          } else {
            return ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailLivrasion()),
                );
              },
              trailing: TextButton(
                onPressed: () {
                  print('Received click');
                },
                child: Text(stat[index]),
              ),
              title: Text('BIG Burgur'),
              subtitle: Text('Created on 20 oct2021'),
            );
          }
        }),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Create_delivery()),
        );
        // Add your onPressed code here!
      },
      child: const Icon(Icons.add),
      backgroundColor: Colors.deepPurple,
    ),
  );
}

// search bar;

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

  List<String> recentList = ["Text 4", "Text 3"];

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
