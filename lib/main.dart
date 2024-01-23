import 'package:flutter/material.dart';
import 'package:input_validation/validation/email_validation.dart';
import 'package:input_validation/validation/password_validation.dart';
import 'package:input_validation/validation/username_validation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();

  /*String? validEmail(String? input) {
    if (input == null) {
      return "Bitte eine E-Mail eingeben";
    }

    if (!input!.contains("@")) {
      return "Bitte eine valide E-Mail eingeben";
    }
    return null;
  }

  String? validPasswordLength(String? input) {
    if (input == null) {
      return "Bitte ein Passwort eingeben";
    }
    if (input.length < 6) {
      return "Bitte ein Passwort mit mindestens 6 Stellen eingeben.";
    }
    return null;
  }

  List<String> usernames = ["Tim12", "Hallo5", "Holga7"];

  String? validUsername(String? input) {
    if (input == null) {
      return "Bitte einen Username eingeben";
    }
    if (input.length < 4) {
      return "Bitte einen Username mit mindestens 4 Stellen eingeben.";
    }
    if (usernames.contains(input!)) {
      return "Username bereits vorhanden";
    }
    return null;
  }*/



  void validateData() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Daten sind valide",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Bitte E-Mail eingeben",
                      ),
                      validator: validEmail,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Bitte Passwort eingeben",
                      ),
                      obscureText: true,
                      validator: validPasswordLength,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Bitte Benutzername eingeben",
                      ),
                      validator: validUsername,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                        child: ElevatedButton(
                            onPressed: () => validateData(),
                            child: const Text("Überprüfen")))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
