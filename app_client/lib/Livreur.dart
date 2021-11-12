import 'package:flutter/material.dart';
import 'package:mel_app/payer_livraison.dart';
import 'login.dart';
import 'registers.dart';
import 'details.dart';
import 'profile.dart';
import 'profile_livreur.dart';
import 'signature.dart';
import 'package:mel_app/creer_livraison.dart';
import 'aide.dart';
import 'about.dart';
import 'localisation.dart';

class Home extends StatefulWidget {
  final List<String> list = List.generate(10, (index) => "Livraison $index");

  @override
  _HomeState createState() => _HomeState();
}

List<String> items = ["Livraison"];

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
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
                  Navigator.push<MaterialPageRoute>(
                    context,
                    MaterialPageRoute(builder: (context) => Payer()),
                  );
                },
                icon: Icon(Icons.notifications)),
            IconButton(
              onPressed: () {
                showSearch<String>(
                    context: context, delegate: Search(widget.list));
              },
              icon: Icon(Icons.search),
            )
          ],
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                child: Text(
                  "Livraisons Postées",
                  style: TextStyle(fontSize: 11),
                ),
              ),
              Tab(
                child: Text(
                  "En attente Du Livreur",
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
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.push<MaterialPageRoute>(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Profile()),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildImageProfile1("images/avatar.png", 90, 96),
                              Text(
                                "John Doe",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                ),
                              ),
                            ],
                          )),
                    ]),
              ),
              ListTile(
                leading: Icon(Icons.help),
                title: Text('Aide'),
                onTap: () => Navigator.push<MaterialPageRoute>(
                  context,
                  MaterialPageRoute(builder: (context) => Aide()),
                ),
              ),
              ListTile(
                leading: Icon(Icons.info_outline),
                title: Text('A propos'),
                onTap: () => Navigator.push<MaterialPageRoute>(
                  context,
                  MaterialPageRoute(builder: (context) => Apropos()),
                ),
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Deconnexion'),
                onTap: () =>
                    Navigator.popUntil(context, ModalRoute.withName('/')),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: ListViewBuilder(),
            ),
            Center(
              child: ListViewBuilder1(),
            ),
            Center(
              child: ListViewBuilderEncours(),
            ),
            Center(
              child: ListViewBuilderEnd(),
            ),
          ],
        ),
      ),
    );
  }
}

class ListViewBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () => Navigator.push<MaterialPageRoute>(
                context,
                MaterialPageRoute(builder: (context) => DetailLivrasion()),
              ),
              trailing: Wrap(
                spacing: 12, // space between two icons
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.push<MaterialPageRoute>(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Create_delivery()),
                      );
                    },
                    icon: Icon(
                      Icons.edit,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Alert'),
                        content: const Text(
                            'Voulez vous  vraiment supprimer cette livraison ?'),
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
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 30,
                    ),
                  ),
                ],
              ),
              title: Text('BIG Burgur'),
              subtitle: Text('Created on 20 oct2021'),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push<MaterialPageRoute>(
            context,
            MaterialPageRoute(builder: (context) => Create_delivery()),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}

// En attente du livreur

class ListViewBuilder1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () => Navigator.push<MaterialPageRoute>(
                context,
                MaterialPageRoute(builder: (context) => DetailLivrasion()),
              ),
              trailing: OutlinedButton(
                onPressed: () {
                  Navigator.push<MaterialPageRoute>(
                    context,
                    MaterialPageRoute(builder: (context) => SignatureLivreur()),
                  );
                },
                child: const Text('Signature'),
              ),
              title: Text('BIG Burgur'),
              subtitle: Text('Created on 20 oct2021'),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push<MaterialPageRoute>(
            context,
            MaterialPageRoute(builder: (context) => Create_delivery()),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}

// Livraison encours
class ListViewBuilderEncours extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () => Navigator.push<MaterialPageRoute>(
                context,
                MaterialPageRoute(builder: (context) => DetailLivrasion()),
              ),
              trailing: Wrap(
                spacing: 15, // space between two icons
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.push<MaterialPageRoute>(
                        context,
                        MaterialPageRoute(builder: (context) => mappPage()),
                      );
                    },
                    icon: Icon(
                      Icons.place,
                      color: Colors.grey,
                      size: 40,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push<MaterialPageRoute>(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfilLivreur()),
                      );
                    },
                    icon: Icon(
                      Icons.account_circle,
                      color: Colors.grey,
                      size: 40,
                    ),
                  ),
                ],
              ),
              title: Text('BIG Burgur'),
              subtitle: Text('Created on 20 oct2021'),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push<MaterialPageRoute>(
            context,
            MaterialPageRoute(builder: (context) => Create_delivery()),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}

// Livraison terminée
class ListViewBuilderEnd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () => Navigator.push<MaterialPageRoute>(
                context,
                MaterialPageRoute(builder: (context) => DetailLivrasion()),
              ),
              trailing: Wrap(
                spacing: 12, // space between two icons
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.push<MaterialPageRoute>(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfilLivreur()),
                      );
                    },
                    icon: Icon(
                      Icons.account_circle,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ),
                ],
              ),
              title: Text('BIG Burgur'),
              subtitle: Text('Created on 20 oct2021'),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push<MaterialPageRoute>(
            context,
            MaterialPageRoute(builder: (context) => Create_delivery()),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
// search bar;

class Search extends SearchDelegate<String> {
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
