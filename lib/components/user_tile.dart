import 'package:crud/models/user.dart';
import 'package:crud/provider/users_provider.dart';
import 'package:crud/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  final User user;
  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              color: Colors.blueAccent,
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(AppRoutes.USER_FORM, arguments: user);
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Excluir Usuário'),
                    content: Text('Deseja excluir usuário?'),
                    actions: [
                      FlatButton(
                        child: Text('Não'),
                        onPressed: () => Navigator.of(context).pop(false),
                      ),
                      FlatButton(
                          child: Text('Sim'),
                          onPressed: () => Navigator.of(context).pop(true))
                    ],
                  ),
                ).then((confirmed) =>
                    Provider.of<UsersProvider>(context, listen: false)
                        .remove(user));
              },
            )
          ],
        ),
      ),
    );
  }
}
