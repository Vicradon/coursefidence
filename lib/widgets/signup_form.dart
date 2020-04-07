import 'package:flutter/material.dart';
import 'package:coursefidence/services/auth_service.dart';

class SignupForm extends StatefulWidget {
  @override
  SignupFormState createState() {
    return SignupFormState();
  }
}

class SignupFormState extends State<SignupForm> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String error = '';
  bool loading = false;

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
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        setState(() => loading = true);
                        final result = await _auth.registerWithEmailAndPassword(
                          _emailController.text,
                          _passwordController.text,
                        );
                        final errorMsg = _auth.signuperrormessage;
                        if (result == null) {
                          setState(() {
                            error = errorMsg;
                            loading = false;
                          });
                        }
                      }
                    },
                    child: Text('Submit'),
                  );
                },
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
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
