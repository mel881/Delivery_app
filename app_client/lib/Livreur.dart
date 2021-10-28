import 'package:flutter/material.dart';
import 'login.dart';

class client_test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}

class Home extends StatefulWidget {
  final List<String> list = List.generate(10, (index) => "Text $index");

  @override
  _HomeState createState() => _HomeState();
}

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
                    children: const [
                      Icon(
                        Icons.account_circle,
                        size: 80,
                        color: Colors.white,
                      ),
                      Text("Compte Client",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ))
                    ]),
              ),
              const ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Profile'),
              ),
              const ListTile(
                leading: Icon(Icons.settings),
                title: Text('Paramétres'),
              ),
              const ListTile(
                leading: Icon(Icons.help),
                title: Text('Aide'),
              ),
              const ListTile(
                leading: Icon(Icons.logout),
                title: Text('Deconnexion'),
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
              trailing: Wrap(
                spacing: 12, // space between two icons
                children: <Widget>[
                  Icon(
                    Icons.edit,
                    color: Colors.grey,
                    size: 30,
                  ),
                  Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 30,
                  ),
                ],
              ),
              title: Text('BIG Burgur'),
              subtitle: Text('Created on 20 oct2021'),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
              trailing: OutlinedButton(
                onPressed: () {
                  print('Received click');
                },
                child: const Text('Signature'),
              ),
              title: Text('BIG Burgur'),
              subtitle: Text('Created on 20 oct2021'),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
              trailing: Wrap(
                spacing: 12, // space between two icons
                children: <Widget>[
                  Icon(
                    Icons.place,
                    color: Colors.grey,
                    size: 30,
                  ),
                  Icon(
                    Icons.account_circle,
                    color: Colors.grey,
                    size: 30,
                  ),
                ],
              ),
              title: Text('BIG Burgur'),
              subtitle: Text('Created on 20 oct2021'),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
              trailing: Wrap(
                spacing: 12, // space between two icons
                children: <Widget>[
                  Icon(
                    Icons.account_circle,
                    color: Colors.grey,
                    size: 30,
                  ),
                ],
              ),
              title: Text('BIG Burgur'),
              subtitle: Text('Created on 20 oct2021'),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
