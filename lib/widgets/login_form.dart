import 'package:flutter/material.dart';
import 'package:coursefidence/services/auth_service.dart';
import 'package:coursefidence/widgets/loading_widget.dart';

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final focusPassword = FocusNode();
  final AuthService _auth = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Form(
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
                      controller: _passwordController,
                      decoration: InputDecoration(
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
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() {
                                loading = true;
                              });
                              _formKey.currentState.save();
                              final result =
                                  await _auth.signInWithEmailAndPassword(
                                _emailController.text,
                                _passwordController.text,
                              );
                              final errorMsg = _auth.signinerrormessage;

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
}
