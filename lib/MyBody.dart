import 'package:flutter/material.dart';

class MyBody extends StatefulWidget {
  const MyBody({super.key});

  @override
  State<MyBody> createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                  _buildIconWithLabel(Icons.call, "Appeler", Colors.pink.shade400, Colors.white),
                  
                  SizedBox(width: 28),
                  _buildIconWithLabel(Icons.mail, "Mail", Colors.pink.shade200, Colors.white),
                  SizedBox(width: 28),
                  _buildIconWithLabel(Icons.share, "Partager", Colors.pink.shade100, Colors.pink.shade700),
                ],
              ),
              Divider(),
              // Ligne d'images unique
              Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Image.asset(
                          "assets/images/image1.png",
                          height: 120,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Image.asset(
                          "assets/images/image2.png",
                          height: 120,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
