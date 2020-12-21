import 'package:crud/components/user_tile.dart';
import 'package:crud/data/dammy_user.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final users = {...DUMMY_USERS};
    return Scaffold(
        appBar: AppBar(
          title: Text('User List'),
          actions: [IconButton(icon: Icon(Icons.add), onPressed: () {})],
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) =>
              UserTile(users.values.elementAt(index)),
        ));
  }
}
