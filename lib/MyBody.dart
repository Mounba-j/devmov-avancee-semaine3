import 'package:flutter/material.dart';

class MyBody extends StatefulWidget {
  const MyBody({super.key});

  @override
  State<MyBody> createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      // Page Accueil
      Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(239, 238, 126, 163),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/couverture.png",
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Text(
                "Bienvenue dans votre Magazine",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                "Votre magazine numérique, notre reussite!",
                style: TextStyle(
                  fontSize: 10,
                  fontFamily: ("Roboto"),
                  color: Colors.pink,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildIconWithLabel(
                    Icons.call,
                    "Appeler",
                    Colors.pink.shade400,
                    Colors.white,
                  ),
                  SizedBox(width: 28),
                  _buildIconWithLabel(Icons.mail, "Mail", Colors.pink.shade200, Colors.white),
                  SizedBox(width: 28),
                  _buildIconWithLabel(Icons.share, "Partager", Colors.pink.shade100, Colors.pink.shade700),
                ],
              ),
              Divider(),
              SizedBox(height: 20),
              // Ligne d'images unique ajustée
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Image.asset(
                        "assets/images/image1.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Image.asset(
                        "assets/images/image2.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      // Page Favoris créative
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.pink.shade50,
              Colors.pink.shade100,
              Colors.pink.shade200,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.favorite, color: Colors.pink, size: 80),
              SizedBox(height: 16),
              Text(
                'Vos favoris',
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.pink.shade700,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Retrouvez ici vos articles préférés !',
                style: TextStyle(fontSize: 16, color: Colors.pink.shade400),
              ),
            ],
          ),
        ),
      ),
      // Page Profil créative
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink.shade100, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.pink.shade200,
                child: Icon(Icons.person, color: Colors.white, size: 50),
              ),
              SizedBox(height: 16),
              Text(
                'Mon Profil',
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.pink.shade700,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Gérez vos informations personnelles ici.',
                style: TextStyle(fontSize: 16, color: Colors.pink.shade400),
              ),
            ],
          ),
        ),
      ),
    ];

    return Scaffold(
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 400),
        child: pages[_selectedIndex],
        transitionBuilder: (child, animation) =>
            FadeTransition(opacity: animation, child: child),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.pink.withOpacity(0.08),
              blurRadius: 12,
              offset: Offset(0, -2),
            ),
          ],
          borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.pink,
          unselectedItemColor: Colors.pink.shade100,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: EdgeInsets.all(_selectedIndex == 0 ? 6 : 0),
                decoration: BoxDecoration(
                  color: _selectedIndex == 0
                      ? Colors.pink.shade50
                      : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.home),
              ),
              label: 'Accueil',
            ),
            BottomNavigationBarItem(
              icon: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: EdgeInsets.all(_selectedIndex == 1 ? 6 : 0),
                decoration: BoxDecoration(
                  color: _selectedIndex == 1
                      ? Colors.pink.shade50
                      : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.favorite),
              ),
              label: 'Favoris',
            ),
            BottomNavigationBarItem(
              icon: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: EdgeInsets.all(_selectedIndex == 2 ? 6 : 0),
                decoration: BoxDecoration(
                  color: _selectedIndex == 2
                      ? Colors.pink.shade50
                      : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.person),
              ),
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconWithLabel(IconData icon, String label, Color bgColor, Color iconColor) {
    void Function()? onTap;
    if (icon == Icons.call) {
      onTap = () {
        // Action d'appel
        print('Appeler cliqué');
        // Ex: launch("tel:0123456789");
      };
    } else if (icon == Icons.mail) {
      onTap = () {
        // Action d'email
        print('Mail cliqué');
        // Ex: launch("mailto:exemple@mail.com");
      };
    } else if (icon == Icons.share) {
      onTap = () {
        // Action de partage
        print('Partager cliqué');
        // Ex: Share.share("Votre message à partager");
      };
    }
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(40),
          child: Container(
            decoration: BoxDecoration(
              color: bgColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: bgColor.withOpacity(0.3),
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            padding: EdgeInsets.all(12),
            child: Icon(icon, color: iconColor, size: 28),
          ),
        ),
        SizedBox(height: 6),
        Text(label, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.pink.shade700)),
      ],
    );
  }
}
