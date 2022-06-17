import 'package:flutter/material.dart';
import '../data/data.dart';
import '../models/user_model.dart';

class FollowingWidget extends StatelessWidget {
  const FollowingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(left: 10),
      scrollDirection: Axis.horizontal,
      itemCount: users.length,
      itemBuilder: (_, __) {
        User user = users[__];
        return GestureDetector(
          onTap: (){},
          child: Container(
            margin: EdgeInsets.all(10),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 2,
                color: Theme.of(context).primaryColor,
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 2),
                    blurRadius: 6),
              ],
            ),
            child: ClipOval(
              child: Image(
                image: AssetImage(user.profileImageUrl!),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
