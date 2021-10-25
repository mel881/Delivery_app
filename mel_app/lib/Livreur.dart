import 'package:flutter/material.dart';

class Mel_test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
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
            children: const <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                ),
                child: Text(
                  'Drawer Header',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text('Messages'),
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
        body: TabBarView(
          children: <Widget>[
            Center(
                child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: ListViewBuilder(),
            )),
            Center(
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                home: ListViewBuilder1(),
              ),
            ),
            Center(
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                home: ListViewBuilderEncours(),
              ),
            ),
            Center(
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                home: ListViewBuilderEnd(),
              ),
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
          itemCount: 5,
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
    );
  }
}

// En attente du livreur

class ListViewBuilder1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 5,
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
    );
  }
}

// Livraison encours
class ListViewBuilderEncours extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 5,
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
    );
  }
}

// Livraison terminée
class ListViewBuilderEnd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 5,
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
    );
  }
}
