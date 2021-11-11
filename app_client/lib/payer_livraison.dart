import 'package:flutter/material.dart';

class Payer extends StatefulWidget {
  const Payer({Key? key}) : super(key: key);

  @override
  _PayerState createState() => _PayerState();
}

TextEditingController _phoneController = TextEditingController();
List<Step> stepList() => [
      Step(
        state: StepState.indexed,
        isActive: true,
        title: const Text('Numero  de transaction'),
        content: input_field("Numero", "Entrer le numero", _phoneController),
      )
    ];

class _PayerState extends State<Payer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payer la livraison"),
      ),
      body: ListView(
        children: [Stepper(steps: stepList())],
      ),
    );
  }
}

Widget input_field(
    String labelText, String hintText, TextEditingController controller) {
  return Container(
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        labelText: labelText,
        hintText: hintText,
      ),
    ),
  );
}
