import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'paranormal_screen.dart';
import 'urban_legend_screen.dart';
import 'real_life_screen.dart';
import 'folklore_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _buildImageBox(String imagePath, String title, Widget screen, {TextStyle? textStyle}) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
          child: Text(
            title,
            style: textStyle ??
                const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChillInk'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.black38,
                image: DecorationImage(
                  image: AssetImage('assets/images/MainMenu.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'Main Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            _buildDrawerItem(
              icon: Icons.person,
              text: 'Profile',
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
            ),
            _buildDrawerItem(
              icon: Icons.email,
              text: 'Contact',
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Contact us at ChillInk@gmail.com')),
                );
              },
            ),
            _buildDrawerItem(
              icon: Icons.settings,
              text: 'Settings',
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Coming Soon in Next Update')),
                );
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 20.0,
            children: [
              _buildImageBox('assets/images/paranormal.jpg', 'Paranormal', ParanormalScreen(), textStyle: const TextStyle(fontFamily: 'FontMain', fontSize: 32.0)),
              _buildImageBox('assets/images/urban_legend.jpg', 'Urban Legend', UrbanLegendScreen(), textStyle: const TextStyle(fontFamily: 'FontMain', fontSize: 32.0)),
              _buildImageBox('assets/images/real_life.jpg', 'Real Life', RealLifeScreen(), textStyle: const TextStyle(fontFamily: 'FontMain', fontSize: 32.0)),
              _buildImageBox('assets/images/folklore.jpg', 'Folklore', FolkloreScreen(), textStyle: const TextStyle(fontFamily: 'FontMain', fontSize: 32.0)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem({required IconData icon, required String text, required GestureTapCallback onTap}) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      leading: Icon(icon, color: Colors.black54),
      title: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
      onTap: onTap,
    );
  }
}
