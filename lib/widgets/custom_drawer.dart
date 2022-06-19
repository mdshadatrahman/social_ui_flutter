import 'package:flutter/material.dart';
import 'package:social_ui/data/data.dart';
import 'package:social_ui/screens/home_screen.dart';
import 'package:social_ui/screens/login_screen.dart';
import 'package:social_ui/screens/profile_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _buildDrawOption(Icon icon, String title, VoidCallback onTap) {
      return ListTile(
        leading: icon,
        title: Text(
          title,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        onTap: onTap,
      );
    }

    return Drawer(
      child: Column(
        children: [
          Stack(
            children: [
              Image(
                height: 200,
                width: double.infinity,
                image: AssetImage(currentUser.backgroundImageUrl.toString()),
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      child: ClipOval(
                        child: Image(
                          image: AssetImage(
                              currentUser.profileImageUrl.toString()),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 6),
                    Text(
                      currentUser.name.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          _buildDrawOption(
            Icon(Icons.home),
            'Home',
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => HomeScreen(),
              ),
            ),
          ),
          _buildDrawOption(Icon(Icons.chat), 'Chat', () {}),
          _buildDrawOption(Icon(Icons.location_on), 'Map', () {}),
          _buildDrawOption(
              Icon(Icons.account_circle),
              'Your Profile',
              () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProfileScreen(user: currentUser),
                    ),
                  )),
          _buildDrawOption(Icon(Icons.settings), 'Settings', () {}),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: _buildDrawOption(
                Icon(Icons.directions_run),
                'Logout',
                () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => LoginScreen(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
