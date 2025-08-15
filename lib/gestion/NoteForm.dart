import 'package:appli/gestion/donnee.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class NoteForm extends StatefulWidget {
  const NoteForm({super.key});

  @override
  State<NoteForm> createState() => _NoteFormPageState();
}

class _NoteFormPageState extends State<NoteForm> {
  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  List<Donnee> text = List.empty(growable: true);

  final formKey = GlobalKey<FormState>();
  String nom = '';
  String prenom = '';
  String email = '';

  // Fonction pour ajouter un rédacteur à Firestore
  Future<void> ajouterRedacteur() async {
    final nom = nomController.text.trim();
    final prenom = prenomController.text.trim();
    final email = emailController.text.trim();
    if (nom.isEmpty || prenom.isEmpty || email.isEmpty) return;
    try {
      await FirebaseFirestore.instance.collection("redacteurs").add({
        "nom": nom,
        "prenom": prenom,
        "email": email,
        "createdAt": FieldValue.serverTimestamp(),
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Rédacteur ajouté à Firestore !")),
      );
      nomController.clear();
      prenomController.clear();
      emailController.clear();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erreur lors de l'ajout : $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 243, 165, 191),
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12.0),
            TextFormField(
              controller: nomController,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 231, 228, 228),
                prefixIcon: Icon(Icons.person),
                labelText: 'Nom',
                hintText: 'Nom',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12.0),
            TextFormField(
              controller: prenomController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 231, 228, 228),
                prefixIcon: Icon(Icons.person),
                labelText: 'Prenom',
                hintText: 'Prenom',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12.0),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                fillColor: Color.fromARGB(255, 231, 228, 228),
                labelText: 'E-mail',
                hintText: 'E-mail',
                helperText: ('votre E-mail doit contenir @'),
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
                filled: true,
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: ajouterRedacteur,
                    child: Text(
                      "+ Ajouter un redacteur ",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.pink,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

 
}
