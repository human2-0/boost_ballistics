import 'package:boost_ballistics/repository/pressing_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:boost_ballistics/models/pressing_model.dart';
import 'package:go_router/go_router.dart';

class PressingForm extends ConsumerStatefulWidget {
  const PressingForm({Key? key}) : super(key: key);
  @override
  PressingFormState createState() => PressingFormState();
}

class PressingFormState extends ConsumerState<PressingForm> {
  // Declare a variable for the number input controller
  late TextEditingController _numberController;
  late TextEditingController _powdersIdController;
  late TextEditingController _weightController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Initialize the number input controller
    _numberController = TextEditingController();
    _powdersIdController = TextEditingController();
    ref.read(pressingRepositoryProvider);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Form'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                context.go('/pressing');
              },
              icon: const Icon(Icons.close)),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: _numberController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Amount',
                    hintText: 'Enter quantity in this stack',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please some numbers';
                    }
                    if (!RegExp(r'^\d+$').hasMatch(value)) {
                      return 'Please enter only digits';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextFormField(
                  controller: _powdersIdController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'QR Code',
                      hintText: 'Please scan QR Code from the powders',
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      prefixIcon: IconButton(
                        onPressed: () {
                          //todo
                        },
                        icon: const Icon(Icons.photo_camera),
                        color: Colors.black,
                      )),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please some numbers';
                    }
                    if (!RegExp(r'^\d+$').hasMatch(value)) {
                      return 'Please enter only digits';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: ElevatedButton(
                  onPressed: () {
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.
                    if (_formKey.currentState!.validate()) {
                      final quantity = _numberController.value.text;
                      final intQuantity = int.parse(quantity);
                      ref
                          .read(pressingRepositoryProvider)
                          .addStackPressing(Pressing(
                            quantity: intQuantity,
                            powdersQr: '',
                            weight: 1,
                          ));
                      // Process data.
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose of the number input controller when the widget is disposed
    _numberController.dispose();
    super.dispose();
  }
}
