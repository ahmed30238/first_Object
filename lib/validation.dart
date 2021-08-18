import 'package:flutter/material.dart';
// import 'package:validation_my1/sign.dart';
import 'package:validation_my1/signup.dart';
// import 'package:validation_my1/signup.dart';

class ValidationView extends StatefulWidget {
  @override
  _ValidationViewState createState() => _ValidationViewState();
}

class _ValidationViewState extends State<ValidationView> {
  bool secure = false;


  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Widget _textField({
    String hintText,
    bool secure,
    String sufText,
    Function validate,
    Function savedData,
    IconButton iconData,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        maxLines: 1,
        onSaved: savedData,
        validator: validate,
        obscureText: secure,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          hintText: hintText,
          suffixText: sufText,
          prefixIcon: iconData,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 150,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Please sign in to continue',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                _textField(
                  hintText: 'Phone Number',
                  iconData:
                      IconButton(icon: Icon(Icons.lock_open), onPressed: () {}),
                  sufText: '',
                  secure: false,
                  validate: (value) {
                    if (value.isEmpty) {
                      return 'Phone Number is required';
                    }
                  },
                ),
                _textField(
                    hintText: 'Password',
                    iconData: IconButton(
                        icon: Icon(Icons.remove_red_eye),
                        onPressed: () {
                          setState(() {
                            secure = !secure;
                          });
                        }),
                    sufText: 'Forgot',
                    secure: secure,
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'Password is required';
                      }
                    }),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (!_formKey.currentState.validate()) {
                            return null;
                          } else
                            ;
                        });
                      },
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                        width: 130,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Expanded(child: SizedBox()),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 25,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Dont have an account?'),
              SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()));
                },
                child: Text(
                  'SignUp',
                  style: TextStyle(fontSize: 16, color: Colors.orange),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
