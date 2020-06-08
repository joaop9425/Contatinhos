import 'package:contatinhos/models/user.dart';
import 'package:contatinhos/providers/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _loadFormData(User user) {
    if (user != null) {
      _formData['id'] = user.id;
      _formData['name'] = user.name;
      _formData['email'] = user.email;
      _formData['phone'] = user.phone;
      _formData['isWhatsapp'] = user.isWhatsapp;
      _formData['avatarUrl'] = user.avatarUrl;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final user = ModalRoute.of(context).settings.arguments;
    _loadFormData(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Usuário'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final isValid = _form.currentState.validate();
              if (isValid) {
                _form.currentState.save();
                Provider.of<Users>(context, listen: false).put(User(
                  id: _formData['id'],
                  name: _formData['name'],
                  email: _formData['email'],
                  phone: _formData['phone'],
                  avatarUrl: _formData['avatarUrl'],
                  isWhatsapp: _formData['isWhatsapp'],
                ));
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['name'],
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nome inválido !';
                  }

                  if (value.trim().length < 3) {
                    return 'Nome é muito pequeno';
                  }

                  return null;
                },
                onSaved: (value) => _formData['name'] = value,
              ),
              TextFormField(
                initialValue: _formData['email'],
                decoration: InputDecoration(labelText: 'E-mail'),
                onSaved: (value) => _formData['email'] = value,
              ),
              TextFormField(
                initialValue: _formData['phone'],
                decoration: InputDecoration(labelText: 'Telefone'),
                onSaved: (value) => _formData['phone'] = value,
              ),
              TextFormField(
                initialValue: _formData['avatarUrl'],
                decoration: InputDecoration(labelText: 'Avatar URL'),
                onSaved: (value) => _formData['avatarUrl'] = value,
              ),
              TextFormField(
                initialValue: _formData['isWhatsapp'],
                decoration: InputDecoration(labelText: 'Tem Whatsapp ?'),
                onSaved: (value) => _formData['isWhatsapp'] = value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
