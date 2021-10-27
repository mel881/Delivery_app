import 'package:flutter/material.dart';

class Admin_app extends StatelessWidget {
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
  final List<String> list = List.generate(10, (index) => "Livraison $index");
  List <String> stat=["encours","postée","terminée","En attente","encours"];
  List <bool> status=[false,true,false,true,false];
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
            children:<Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                ),
                child:Column(
                  
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    
                    Icon(
                    Icons.account_circle,size:80,color:Colors.white,
                    ),
                    Text(
                      "Compte Admin",
                      style:TextStyle(
                        color:Colors.white,
                        fontSize: 30,
                      )
                      
                    )

                  ]
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
              home:statut(stat) ,
            )),
           
            Center(
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                home: livreur(status),
              ),
            ),
            Center(
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                home: livreur(status),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





  Widget livreur(List <bool> status) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Icon(Icons.account_circle,
              size:40,),

              trailing: status[index]? OutlinedButton(
                onPressed: () {
                  print('Received click');
                },
                child:  Text("activé"),
              )
              : Wrap(
                   spacing: 12, // space between two icons
                children: <Widget>[
                   Icon(
                    Icons.edit,
                    color: Colors.grey,
                    size: 30,
                  ),
                  OutlinedButton(
                onPressed: () {
                  print('Received click');
                },
                child:  Text("desactivé"),
              )
                ],
              ),
              
              title: const Text('John Doe'),
             // subtitle: Text('Created on 20 oct2021'),
            );
          }),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        // Add your onPressed code here!
      },
      child: const Icon(Icons.add),
      backgroundColor: Colors.deepPurple,
    ),
    );
  }
// Livraison;
Widget statut(List<String> stat){
  return Scaffold(
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              trailing:  OutlinedButton(
                onPressed: () {
                  print('Received click');
                },
                child:  Text(stat[index]),
              ),
              title: Text('BIG Burgur'),
              subtitle: Text('Created on 20 oct2021'),
            );
          }),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
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
          onTap: (){
            selectedResult = suggestionList[index];
            showResults(context);
          },
        );
      },
    );
  }
}



