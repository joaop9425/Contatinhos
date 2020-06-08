import 'package:contatinhos/components/user_tile.dart';
import 'package:contatinhos/providers/users.dart';
import 'package:contatinhos/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuários'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // users.put(User(
              //   name: 'Teste',
              //   email: 'teste@teste.com',
              //   isWhatsapp: false,
              //   phone: 34999991234,
              //   avatarUrl: ''
              // ));
              // users.remove(users.byIndex(0));
              Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (ctx, i) => UserTile(
          users.byIndex(i),
        ),
      ),
    );
  }
}
