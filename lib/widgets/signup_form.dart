import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

class SignupForm extends StatefulWidget {
  @override
  SignupFormState createState() {
    return SignupFormState();
  }
}

class SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success;
  String _userEmail;

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
                controller: _emailController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: 'johndoe@xyz.com',
                  labelText: 'Email*',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                onSaved: (String value) {},
              ),
              TextFormField(
                controller: _passwordController,
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
              ),
              SizedBox(height: 30),
              Builder(
                builder: (BuildContext context) {
                  return RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {}
                    },
                    child: Text('Submit'),
                  );
                },
              ),
              Container(
                alignment: Alignment.center,
                child: Text(_success == null
                    ? ''
                    : (_success
                        ? 'Successfully registered ' + _userEmail
                        : 'Registration failed')),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Already have an account?"),
                  FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text("login"),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
