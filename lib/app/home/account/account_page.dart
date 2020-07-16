import 'package:ecommerce_flutter_firebase/constants/keys.dart';
import 'package:ecommerce_flutter_firebase/constants/strings.dart';
// import 'package:ecommerce_flutter_firebase/common/avatar.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.accountPage),
        actions: <Widget>[
          FlatButton(
            key: Key(Keys.logout),
            child: Text(
              Strings.logout,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            onPressed: () => print('logout pressed'),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(130.0),
          child: Text("User Info"),
        ),
      ),
    );
  }

  // Widget _buildUserInfo(User user) {
  //   return Column(
  //     children: [
  //       Avatar(
  //         photoUrl: user.photoUrl,
  //         radius: 50,
  //         borderColor: Colors.black54,
  //         borderWidth: 2.0,
  //       ),
  //       const SizedBox(height: 8),
  //       if (user.displayName != null)
  //         Text(
  //           user.displayName,
  //           style: TextStyle(color: Colors.white),
  //         ),
  //       const SizedBox(height: 8),
  //     ],
  //   );
  // }
}
