import 'package:crud/components/user_tile.dart';
import 'package:crud/models/user.dart';
import 'package:crud/provider/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UsersProvider users = Provider.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('User List'),
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  users.put(User(
                      name: 'Teste', email: 'teste@email.com', avatarUrl: ''));
                })
          ],
        ),
        body: ListView.builder(
          itemCount: users.count,
          itemBuilder: (context, index) => UserTile(users.byIndex(index)),
        ));
  }
}
