import 'package:flutter/material.dart';
import 'package:social_ui/widgets/custom_drawer.dart';

import '../models/user_model.dart';
import '../widgets/profile_clipper.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scafoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scafoldState,
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipPath(
                  clipper: ProfileClipper(),
                  child: Image(
                    height: 300,
                    width: double.infinity,
                    image: AssetImage(widget.user.backgroundImageUrl.toString()),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  child: IconButton(
                    onPressed: () => _scafoldState.currentState?.openDrawer(),
                    icon: Icon(
                      Icons.menu,
                      size: 30,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image(
                        height: 120,
                        width: 120,
                        image: AssetImage(widget.user.profileImageUrl.toString()),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
