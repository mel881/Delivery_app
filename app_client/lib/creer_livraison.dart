import 'package:flutter/material.dart';
import 'package:mel_app/Livreur.dart';

class Create_delivery extends StatefulWidget {
  const Create_delivery({Key? key}) : super(key: key);

  @override
  _Create_deliveryState createState() => _Create_deliveryState();
}

int _activeStepIndex = 0;

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

  List<String> region = [
    "Nord",
    "Extreme-Nord",
    "Adamaoua",
    "Centre",
    "Littoral",
    "Sud",
    "Est",
    "Ouest",
    "Nord-Ouest",
    "Sud-Ouest"
  ];
  List<String> ville = [
    "yaoundé ",
    "Douala",
    "Kribi",
    "Dscang",
    "Maroua",
  ];
  List<String> poids = [
    "1-10 Kg ",
    "10-20 Kg",
    "20-30 kg",
    "30-50 KG",
  ];
  List<String> encombrement = [
    "petit",
    "Moyen",
    "Grand",
  ];
  List<String> paiement = [
    "orange Money",
    "MTN Money",
  ];
  List<Step> stepList() => [
        Step(
          state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 0,
          title: const Text('Information du Colis'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 15),
                textFiel("Nom", "nom", nameControl, false),
                SizedBox(height: 16),
                textFiel("Description du colis", "description",
                    descriptionControl, false),
                SizedBox(height: 16),
                selectFiel("Selectionner", "poids", poidsControl, false, poids),
                SizedBox(height: 16),
                textFiel("photos", "selectionner une photo du colis",
                    photoControl, true),
                SizedBox(height: 16),
                selectFiel("selectionner", "encombrement", encombrementControl,
                    false, encombrement),
                SizedBox(height: 16),
                selectFiel("Selectionner", "paiement", paiementControl, false,
                    paiement),
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
                  selectFiel(
                      "selectionner", "region", regionControl, false, region),
                  SizedBox(height: 16),
                  selectFiel(
                      "selectionner", "ville", villeControl, false, ville),
                  SizedBox(height: 16),
                  textFiel("Entrer les coordonnées de depart du colis",
                      "Lieu de depart", lieuDepControl, false),
                  SizedBox(height: 16),
                  textFiel("coordonnées du lieu d'arrivé", "Lieu d'arrivé",
                      lieuArrControl, false),
                  SizedBox(height: 16),
                  textFiel("Entrer le nom du recepteur du colis",
                      "Nom du destinataire", nomDesControl, false),
                  SizedBox(height: 16),
                  textFiel("Entrer le contact du recepteur", "contact",
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
                    if (_activeStepIndex > 0)
                      Expanded(
                        child: ElevatedButton(
                          onPressed: onStepCancel,
                          child: const Text('Back'),
                        ),
                      ),
                    const SizedBox(
                      width: 10,
                    ),
                    (isLastStep)
                        ? Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()),
                                );
                              },
                              child: const Text('Submit'),
                            ),
                          )
                        : Expanded(
                            child: ElevatedButton(
                              onPressed: onStepContinue,
                              child: const Text('Next'),
                            ),
                          ),
                    const SizedBox(
                      width: 10,
                    ),
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

Widget textFiel(
  String hintText,
  String label,
  TextEditingController control,
  bool photo,
) {
  return TextFormField(
    controller: control,

    decoration: InputDecoration(
      prefixIcon: photo ? Icon(Icons.add_a_photo) : null,
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

Widget selectFiel(String hintText, String label, TextEditingController control,
    bool photo, List<String> attribut) {
  String controller;
  var items = attribut;

  return TextFormField(
    controller: control,

    decoration: InputDecoration(
      prefixIcon: photo ? Icon(Icons.add_a_photo) : null,
      suffixIcon: PopupMenuButton<String>(
        icon: const Icon(Icons.arrow_drop_down),
        onSelected: (String value) {
          control.text = value;
        },
        itemBuilder: (BuildContext context) {
          return items.map<PopupMenuItem<String>>((String value) {
            return new PopupMenuItem(child: new Text(value), value: value);
          }).toList();
        },
      ),
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
