import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mel_app/login.dart';

class Payer extends StatefulWidget {
  const Payer({Key? key}) : super(key: key);

  @override
  _PayerState createState() => _PayerState();
}

int _activeStepIndex = 0;
final _formKey = GlobalKey<FormState>();
TextEditingController _phoneController = TextEditingController();
TextEditingController _codeController = TextEditingController();
List<Step> stepList() => [
      Step(
        state: StepState.indexed,
        title: const Text('Numero  de transaction'),
        content: Padding(
            padding: EdgeInsets.all(12),
            child: TextFormField(
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  labelText: 'Numero',
                  hintText: "Entrer le numero de transaction ",
                ),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                controller: _phoneController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Entrer le numero de la transcation  ";
                  }
                  if (value.length < 9 || value.length > 9) {
                    return "9 chiffres attendus";
                  }
                  if (value[0] != "6") {
                    return "Numero incorrect";
                  }
                  return null;
                })),
      ),
      Step(
        state: StepState.indexed,
        title: const Text('Tapez le #150*4*4#'),
        content: Text("  un Code vous sera envoyé par message"),
      ),
      Step(
          state: StepState.indexed,
          title: const Text(' Code secret de 6 chiffre'),
          content: Padding(
              padding: EdgeInsets.all(12),
              child: TextFormField(
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    labelText: 'Code ',
                    hintText: "Entrer le code ",
                  ),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  controller: _codeController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Entrer le code   ";
                    }
                    if (value.length < 6 || value.length > 6) {
                      return "6 chiffres attendus";
                    }

                    return null;
                  }))),
    ];

class _PayerState extends State<Payer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payer la livraison"),
      ),
      body: ListView(
        children: [
          Form(
            key: _formKey,
            child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(children: [
                  Text(
                    "Montant :10000 XAF",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
                  ),
                  Card(
                      child: Ink.image(
                    image: AssetImage("images/orange.png"),
                    fit: BoxFit.cover,
                    height: 128,
                  )),
                  Row(
                    children: [
                      numberIcon('1', Colors.white, Colors.deepPurple),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        "Numéro de transaction",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(16, 5, 16, 5),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        border: Border(left: BorderSide(color: Colors.grey))),
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: TextFormField(
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16)),
                            labelText: 'Numéro de la transaction ',
                            hintText: "Entrer le numéro de transaction ",
                          ),
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          controller: _phoneController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Entrer le numero de la transcation  ";
                            }
                            if (value.length < 9 || value.length > 9) {
                              return "9 chiffres attendus";
                            }
                            if (value[0] != "6") {
                              return "Numero incorrect";
                            }
                            return null;
                          }),
                    ),
                  ),
                  Row(
                    children: [
                      numberIcon('2', Colors.white, Colors.deepPurple),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        'Tapez le #150*4*4#',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(16, 5, 16, 5),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        border: Border(left: BorderSide(color: Colors.grey))),
                    child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Text("Un Code vous sera envoyé par message")),
                  ),
                  Row(
                    children: [
                      numberIcon('3', Colors.white, Colors.deepPurple),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        'Entre le code de 6 chiffre',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(16, 5, 16, 5),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          border: Border(left: BorderSide(color: Colors.grey))),
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: TextFormField(
                            decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              labelText: 'Code ',
                              hintText: "Entrer le code ",
                            ),
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            controller: _codeController,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Entrer le code   ";
                              }
                              if (value.length < 6 || value.length > 6) {
                                return "6 chiffres attendus";
                              }

                              return null;
                            }),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {}
                        ;
                      },
                      child: Text('Valider'))
                ]
                    /*Stepper(
                steps: stepList(),
                type: StepperType.vertical,
                currentStep: _activeStepIndex,
                onStepContinue: () {
                  if (_activeStepIndex < (stepList().length - 1)) {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        _activeStepIndex += 1;
                      });
                    }
                  }
                },
                onStepCancel: () {
                  if (_activeStepIndex != 0) {
                    setState(() {
                      _activeStepIndex -= 1;
                    });
                  }
                  ;
                },
                onStepTapped: (int index) {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      _activeStepIndex = index;
                    });
                    Navigator.push<MaterialPageRoute>(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  }
                },
                controlsBuilder: (context, {onStepContinue, onStepCancel}) {
                  final isLastStep = _activeStepIndex == stepList().length - 1;
                  return Container(
                    child: Row(
                      children: [
                        if (_activeStepIndex > 0)
                          Expanded(
                            child: ElevatedButton(
                              onPressed: onStepCancel,
                              child: const Text('Retour'),
                            ),
                          ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: onStepContinue,
                            child: (isLastStep)
                                ? const Text('Valider')
                                : const Text('Continue'),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  );
                },
              )*/
                    )),
          )
        ],
      ),
    );
  }
}

Widget numberIcon(String number, Color textcolor, Color color) {
  return ClipOval(
      child: Material(
    color: Colors.transparent,
    child: Ink(
      padding: EdgeInsets.fromLTRB(2, 6, 2, 2),
      height: 32,
      width: 32,
      child: Text(
        number,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: textcolor,
          fontSize: 16,
        ),
      ),
      color: color,
    ),
  ));
}
