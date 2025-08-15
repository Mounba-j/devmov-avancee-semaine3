
import 'package:flutter/material.dart';
import 'package:appli/gestion/GestionRedacteurs.dart';
class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 240, 191, 207),
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.pink, Colors.white]),
            ),
            child: Text(
              "Menu",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Times new roman",
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Column(
            children: [
  ListTile(
                title: Text(
                  "Gestion",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GestionRedacteurs()),
                  );
                },
              ),

            
              Divider(color: Colors.amber),
              ListTile(
                title: Text(
                  "A propos",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                onTap: () {
                 
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
