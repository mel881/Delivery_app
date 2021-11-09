import 'package:flutter/material.dart';
import 'package:admin_app/create_account.dart';
import 'package:admin_app/admin_app.dart';

class Create_delivery extends StatefulWidget {
  const Create_delivery({Key? key}) : super(key: key);

  @override
  _Create_deliveryState createState() => _Create_deliveryState();
}

int _activeStepIndex = 0;
final _formqey = GlobalKey<FormState>();
final _formKey = GlobalKey<FormState>();

class _Create_deliveryState extends State<Create_delivery> {
  TextEditingController nameControl = TextEditingController();
  TextEditingController descriptionControl = TextEditingController();
  TextEditingController poidsControl = TextEditingController();
  TextEditingController encombrementControl = TextEditingController();
  TextEditingController paiementControl = TextEditingController();
  TextEditingController regionControl = TextEditingController();
  TextEditingController villeControl = TextEditingController();
  TextEditingController lieuDepControl = TextEditingController();
  TextEditingController lieuArrControl = TextEditingController();
  TextEditingController nomDesControl = TextEditingController();
  TextEditingController contactControl = TextEditingController();
  TextEditingController photoControl = TextEditingController();

  List<Step> stepList() => [
        Step(
          state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 0,
          title: const Text('Information du Colis'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 15),
                textFiel("Nom", "nom", false, nameControl, false),
                SizedBox(height: 16),
                textFiel("Description du colis", "description", false,
                    descriptionControl, false),
                SizedBox(height: 16),
                textFiel("Selectionner", "poids", true, poidsControl, false),
                SizedBox(height: 16),
                textFiel("photos", "selectionner une photo du colis", false,
                    photoControl, true),
                SizedBox(height: 16),
                textFiel("selectionner", "encombrement", true,
                    encombrementControl, false),
                SizedBox(height: 16),
                textFiel(
                    "Selectionner", "paiement", true, paiementControl, false),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
        Step(
            state:
                _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
            isActive: _activeStepIndex >= 1,
            title: const Text('Adresse'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 16),
                  textFiel(
                      "selectionner", "region", true, regionControl, false),
                  SizedBox(height: 16),
                  textFiel("selectionner", "ville", true, villeControl, false),
                  SizedBox(height: 16),
                  textFiel("Entrer le lieu de  depart du coli",
                      "Lieu de depart", false, lieuDepControl, false),
                  SizedBox(height: 16),
                  textFiel("Entrer le lieu d'arrivé du coli", "Lieu d'arrivé",
                      false, lieuArrControl, false),
                  SizedBox(height: 16),
                  textFiel("Entrer le nom du recepteur du colis",
                      "Nom du destinataire", false, nomDesControl, false),
                  SizedBox(height: 16),
                  textFiel("Entrer le contact du recepteur", "contact", false,
                      contactControl, false),
                ],
              ),
            )),
        Step(
            state: StepState.complete,
            isActive: _activeStepIndex >= 2,
            title: const Text('Confirm'),
            content: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Name: ${nameControl.text}'),
                Text('Description: ${descriptionControl.text}'),
                Text('Poids : ${poidsControl.text}'),
                Text('Encombrement : ${encombrementControl.text}'),
                Text('Paiement : ${paiementControl.text}'),
                Text('Region : ${regionControl.text}'),
                Text('Ville : ${villeControl.text}'),
                Text('Lieu de depart : ${lieuDepControl.text}'),
                Text('Lieu arrivé : ${lieuArrControl.text}'),
                Text('Nom destinataire : ${nomDesControl.text}'),
                Text('Contact : ${contactControl.text}'),
              ],
            )))
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Center(
          child: Text(
            "Initier Une Livraison",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Stepper(
            physics: ClampingScrollPhysics(),
            type: StepperType.vertical,
            currentStep: _activeStepIndex,
            steps: stepList(),
            onStepContinue: () {
              if (_activeStepIndex < (stepList().length - 1)) {
                setState(() {
                  _activeStepIndex += 1;
                });
              } else {
                print('Submited');
              }
            },
            onStepCancel: () {
              if (_activeStepIndex == 0) {
                return;
              }

              setState(() {
                _activeStepIndex -= 1;
              });
            },
            onStepTapped: (int index) {
              setState(() {
                _activeStepIndex = index;
              });
            },
            controlsBuilder: (context, {onStepContinue, onStepCancel}) {
              final isLastStep = _activeStepIndex == stepList().length - 1;
              return Container(
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: isLastStep
                            ? () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'données en cours de traitement')),
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()),
                                );
                              }
                            : onStepContinue,
                        child: (isLastStep)
                            ? const Text('Submit')
                            : const Text('Next'),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    if (_activeStepIndex > 0)
                      Expanded(
                        child: ElevatedButton(
                          onPressed: onStepCancel,
                          child: const Text('Back'),
                        ),
                      )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// fonction permettant de creer les inputs
Widget textFiel(String hintText, String label, bool select,
    TextEditingController control, bool photo) {
  String controller;
  var items = [
    'Working a lot harder',
    'Being a lot smarter',
    'Being a self-starter',
    'Placed in charge of trading charter'
  ];

  return TextFormField(
    controller: control,
    decoration: InputDecoration(
      prefixIcon: photo ? Icon(Icons.add_a_photo) : null,
      suffixIcon: select
          ? PopupMenuButton<String>(
              icon: const Icon(Icons.arrow_drop_down),
              onSelected: (String value) {
                control.text = value;
              },
              itemBuilder: (BuildContext context) {
                return items.map<PopupMenuItem<String>>((String value) {
                  return new PopupMenuItem(
                      child: new Text(value), value: value);
                }).toList();
              },
            )
          : null,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(23)),
      labelText: label,
      hintText: hintText,
    ),
    // The validator receives the text that the user has entered.
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    },
  );
}
