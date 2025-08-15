import 'package:appli/gestion/NoteForm.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GestionRedacteurs extends StatefulWidget {
  const GestionRedacteurs({super.key});

  @override
  State<GestionRedacteurs> createState() => _GestionRedacteursState();
}

class _GestionRedacteursState extends State<GestionRedacteurs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gestion des Redacteurs',
          style: TextStyle(
            color: Colors.white,
            fontFamily: "roboto",
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(child: _buildListeRedacteurs()),
          NoteForm(),
        ],
      ),
    );
  }

  Widget _buildListeRedacteurs() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('redacteurs').orderBy('createdAt', descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Text('Aucun rédacteur enregistré.'));
        }
        final docs = snapshot.data!.docs;
        return ListView.builder(
          itemCount: docs.length,
          itemBuilder: (context, index) {
            final doc = docs[index];
            final data = doc.data() as Map<String, dynamic>;
            return Card(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: ListTile(
                title: Text('${data['nom']} ${data['prenom']}'),
                subtitle: Text(data['email'] ?? ''),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.blue),
                      onPressed: () => _editerRedacteur(doc),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _effacerRedacteur(doc.id),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _effacerRedacteur(String docId) async {
    await FirebaseFirestore.instance.collection('redacteurs').doc(docId).delete();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Rédacteur supprimé.')),
    );
  }

  void _editerRedacteur(QueryDocumentSnapshot doc) async {
    final data = doc.data() as Map<String, dynamic>;
    final nomController = TextEditingController(text: data['nom']);
    final prenomController = TextEditingController(text: data['prenom']);
    final emailController = TextEditingController(text: data['email']);

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Éditer le rédacteur'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nomController,
                decoration: InputDecoration(labelText: 'Nom'),
              ),
              TextField(
                controller: prenomController,
                decoration: InputDecoration(labelText: 'Prénom'),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Annuler'),
            ),
            ElevatedButton(
              onPressed: () async {
                await FirebaseFirestore.instance.collection('redacteurs').doc(doc.id).update({
                  'nom': nomController.text.trim(),
                  'prenom': prenomController.text.trim(),
                  'email': emailController.text.trim(),
                });
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Rédacteur modifié.')),
                );
              },
              child: Text('Enregistrer'),
            ),
          ],
        );
      },
    );
  }
}
