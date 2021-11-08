import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'dart:ui';

import 'package:signature/signature.dart';

class SignatureLivreur extends StatefulWidget {
  const SignatureLivreur({Key? key}) : super(key: key);

  @override
  _SignatureLivreurState createState() => _SignatureLivreurState();
}

class _SignatureLivreurState extends State<SignatureLivreur> {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.black,
    exportBackgroundColor: Colors.grey,
    onDrawStart: () => print('onDrawStart called!'),
    onDrawEnd: () => print('onDrawEnd called!'),
  );

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => print('Value changed'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: ListTile(
            title: Text(
              "Signature",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              "Big Burger",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(12),
          child: ListView(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text("Signature du livreur ",
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
                IconButton(
                  icon: const Icon(Icons.cleaning_services_outlined),
                  color: Colors.deepPurple,
                  onPressed: () {
                    setState(() => _controller.clear());
                  },
                ),
              ]),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200],
                ),
                padding: EdgeInsets.all(12),
                child: Signature(
                  controller: _controller,
                  height: 300,
                  backgroundColor: Colors.grey.shade200,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              ElevatedButton(
                child: Text("Valider"),
                onPressed: () async {
                  if (_controller.isNotEmpty) {
                    final Uint8List? data = await _controller.toPngBytes();
                    if (data != null) {
                      await Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                            return Container(
                                color: Colors.grey[300],
                                child: Scaffold(
                                    appBar: AppBar(
                                      title: Text("Signature"),
                                    ),
                                    body: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 32, 10, 32),
                                        child: Center(
                                            child: Column(children: [
                                          Image.memory(data),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text("Save")),
                                              ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text("Annuler")),
                                            ],
                                          )
                                        ])))));
                          },
                        ),
                      );
                    }
                  }
                },
              ),
            ],
          ),
        ));
  }
}
