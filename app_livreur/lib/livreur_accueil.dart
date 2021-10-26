import 'package:flutter/material.dart';

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
              children: const <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                  ),
                  child: Text(
                    'John Doe',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.message),
                  title: Text(''),
                ),
                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text('Profile'),
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                ),
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
          trailing: Wrap(
            spacing: 12, // space between two icons
            children: <Widget>[
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Choisir",
                  style: TextStyle(color: Colors.deepPurple),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple.shade200,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32))),
              ),
            ],
          ),
          title: Text('BIG Burgur'),
          subtitle: Text('Created on 20 oct2021'),
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
                onPressed: () {},
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
                onPressed: () {},
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
                onPressed: () {},
                child: Text(
                  "Details",
                  style: TextStyle(
                    color: Colors.yellow.shade800,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.yellow.shade200,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32))),
              ),
            ],
          ),
          title: Text('BIG Burgur'),
          subtitle: Text('Created on 20 oct2021'),
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
