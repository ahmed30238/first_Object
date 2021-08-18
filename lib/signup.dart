import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _confirmPass = TextEditingController();


  bool secure = true;
  String _password;
  String _email;
  String _confirmpassword;
  String name;

  Widget _textField({
    String hintText,
    bool secure,
    String sufText,
    Function validate,
    Function savedData,
    IconButton iconData,
    TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        onSaved: savedData,
        validator: validate,
        obscureText: secure,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(20),
          hintText: hintText,
          suffixText: sufText,
          prefixIcon: iconData,
        ),
      ),
    );
  }
  _subConfirm() {
    if (!_formKey.currentState.validate()) {
      return null;
    } else
      _formKey.currentState.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Create Account',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                _textField(
                  hintText: 'FULL NAME',
                  iconData:
                      IconButton(icon: Icon(Icons.lock_open), onPressed: () {}),
                  sufText: '',
                  secure: false,
                  savedData: (value) {
                    setState(() {
                      name = value;
                      print(name);
                    });
                  },
                  validate: (value) {
                    if (value.isEmpty) {
                      return 'Item required';
                    }
                  },
                ),
                _textField(
                  hintText: 'Email',
                  iconData:
                      IconButton(icon: Icon(Icons.email), onPressed: () {}),
                  sufText: '',
                  secure: false,
                  savedData: (value) {
                    setState(() {
                      _email = value;
                      print(_email);
                    });
                  },
                  validate: (value) {
                    if (value.isEmpty) {
                      return 'Item required';
                    }
                  },
                ),

                _textField(
                  controller: _confirmPass,
                  hintText: 'PASSWORD',
                  savedData: (value) {
                    setState(() {
                      _password = value;
                      print(_password);
                    });
                  },
                  secure: secure,
                  iconData: IconButton(
                      icon: Icon(Icons.lock),
                      onPressed: () {
                        setState(() {
                          secure = !secure;
                        });
                      }),
                  validate: (value) {
                    if (value.isEmpty) {
                      return 'Password required and not less than 8';
                    } else
                      return null;
                  },
                ),
                _textField(
                  hintText: 'CONFIRM PASSWORD',
                  iconData: IconButton(
                      icon: Icon(Icons.lock),
                      onPressed: () {
                        setState(() {
                          secure = !secure;
                        });
                      }),
                  savedData: (value) {
                    setState(() {
                      _confirmpassword = value;
                      print(_confirmpassword);
                    });
                  },
                  secure: secure,
                  validate: (value) {
                      if (value == _confirmPass.text) {
                        return 'Matching falied';
                      } else
                        return null;
                    },
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    _subConfirm();
                    print(_password);
                    print(_email);
                  });
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Container(
                    // margin: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Text(
                          'SignUp',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Expanded(child: SizedBox()),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 35,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Already have an account?'),
              SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Sign in',
                  style: TextStyle(fontSize: 16, color: Colors.orange),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
