import 'package:flutter/material.dart';
import 'package:social_ui/widgets/custom_drawer.dart';

import '../models/user_model.dart';
import '../widgets/post_carousel.dart';
import '../widgets/profile_clipper.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  late PageController _yourPostsController;
  late PageController _yourFavoritePostController;

  @override
  void initState() {
    super.initState();
    _yourPostsController =
        PageController(initialPage: 0, viewportFraction: 0.8);
    _yourFavoritePostController =
        PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
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
                    image:
                        AssetImage(widget.user.backgroundImageUrl.toString()),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  child: IconButton(
                    onPressed: () => _scaffoldState.currentState?.openDrawer(),
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
                          color: Colors.black54,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image(
                        height: 120,
                        width: 120,
                        image:
                            AssetImage(widget.user.profileImageUrl.toString()),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              widget.user.name.toString(),
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'Following',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black45,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      widget.user.following.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Followers',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black54,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      widget.user.followers.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )
                  ],
                )
              ],
            ),
            PostCarousel(
              pageController: _yourPostsController,
              title: 'Your Posts',
              posts: widget.user.posts!.toList(),
            ),
            PostCarousel(
              pageController: _yourFavoritePostController,
              title: 'Favorites',
              posts: widget.user.favorites!.toList(),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
