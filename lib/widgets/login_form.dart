import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final focusPassword = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 0),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'e.g. John Doe | johndoe@xyz.com',
                  labelText: 'Username or email*',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a valid username';
                  }
                  return null;
                },
                onSaved: (String value) {},
                onFieldSubmitted: (v) {
                  FocusScope.of(context).requestFocus(focusPassword);
                },
              ),
              TextFormField(
                inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  icon: Icon(Icons.lock),
                  hintText: 'some_password',
                  labelText: 'Password *',
                ),
                obscureText: true,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Password is required';
                  }
                  return null;
                },
                onSaved: (String value) {},
                focusNode: focusPassword,
              ),
              SizedBox(height: 30),
              Builder(
                builder: (BuildContext context) {
                  return RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text('Submit'),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Don't have an account yet?"),
                  FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: Text("sign up"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
