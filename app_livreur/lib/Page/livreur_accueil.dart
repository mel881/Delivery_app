import 'package:app_livreur/widget/buildwidget.dart';
import 'aide.dart';
import 'choix_livraison.dart';
import 'profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login_livreur.dart';
import 'commissions.dart';
import 'details_commissions.dart';
import 'code_secret.dart';

class Accueil extends StatefulWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  _AccueilState createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  final List<String> list = List.generate(10, (index) => "Livraison $index");

  @override
  List<bool> payer = [
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
    false,
    true,
    false
  ];

  Widget build(BuildContext context) {
    List<bool> payer = [
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
      false,
      true,
      false
    ];

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
                    onTap: () {
                      Navigator.popUntil(context, ModalRoute.withName('/'));
                    })
              ],
            ),
          ),
          body: TabBarView(children: <Widget>[
            Center(child: createListTabs()),
            Center(child: createListTabs2(payer)),
            Center(child: createListTabs3()),
          ])),
    );
  }
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
