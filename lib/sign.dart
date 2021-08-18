import 'package:flutter/material.dart';

import 'dart:ui';


class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String _email;
  String _password;
  String _confirmPassword;
  bool _secure = true;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _confirmpass = TextEditingController();

  Widget _textformfield({
    String hint,
    IconButton icon,
    bool secure,
    Function validate,
    Function onsave,
    TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: TextFormField(
        controller: controller,
        validator: validate,
        onSaved: onsave,
        decoration: InputDecoration(
          prefixIcon: icon,
          hintText: hint,
        ),
        obscureText: secure,
      ),
    );
  }

  _supmitForm() {
    if (!_formKey.currentState.validate()) {
      return;
    } else
      _formKey.currentState.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Row(
                  children: [
                    Text(
                      'Create Account',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Material(
              elevation: 10,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 65,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text(
                          'Full Name',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Wrap(
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.black87,
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            'Salama',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,

          ),
          Form(
              key: _formKey,
              child: Column(
                children: [
                  _textformfield(
                    hint: 'EMAIL',
                    onsave: (value) {
                      setState(() {
                        _email = value;
                        print(_email);
                      });
                    },
                    icon: IconButton(icon: Icon(Icons.email), onPressed: () {}),
                    secure: false,
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'Email Required';
                      } else
                        return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  _textformfield(
                    controller: _confirmpass,
                    hint: 'PASSWORD',
                    onsave: (value) {
                      setState(() {
                        _password = value;
                        print(_password);
                      });
                    },
                    secure: _secure,
                    icon: IconButton(
                        icon: Icon(Icons.lock),
                        onPressed: () {
                          setState(() {
                            _secure = !_secure;
                          });
                        }),
                    validate: (value) {
                      if (value.isEmpty || value.toString().length < 8) {
                        return 'Password required and not less than 8';
                      } else
                        return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  _textformfield(
                    hint: 'CONFIRM PASSWORD',
                    icon: IconButton(
                        icon: Icon(Icons.lock),
                        onPressed: () {
                          setState(() {
                            _secure = !_secure;
                          });
                        }),
                    onsave: (value) {
                      setState(() {
                        _confirmPassword = value;
                        print(_confirmPassword);
                      });
                    },
                    secure: _secure,
                    validate: (value) {
                      if (value != _confirmpass.text) {
                        return 'Matching falied';
                      } else
                        return null;
                    },
                  ),
                ],
              )),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                height: 50,
                width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.yellow[900],
                ),
                child: Row(
                  children: [
                    FlatButton(
                        onPressed: () {
                          _supmitForm();
                        },
                        child: Text('SIGN UP',
                            style:
                                TextStyle(fontSize: 18, color: Colors.white))),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    )
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Already have an account? ',
                style: TextStyle(fontSize: 16),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  'sign in',

                  style: TextStyle(
                      color: Colors.yellow[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
