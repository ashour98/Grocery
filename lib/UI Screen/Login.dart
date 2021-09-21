import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/constant/Custome%20logo.dart';
import 'package:grocery_app/constant/Custome%20textfield.dart';



class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  String _email, _password;

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Form(
        key: _globalKey,
        child: Scaffold(
          backgroundColor: Colors.lightGreen,
          body: ListView(
            children: [
              Customelogo(),
              SizedBox(
                height: height * .05,
              ),
              CustomeTextField(
                onClick: (value) {
                  _email = value;
                },
                hint: 'Enter your email',
                icon: Icons.email,
              ),
              SizedBox(
                height: height * .01,
              ),
              CustomeTextField(
                  onClick: (value) {
                    _password = value;
                  },
                  icon: Icons.lock,
                  hint: 'Enter your Password'),
              SizedBox(
                height: height * .02,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 120),
                child: Builder(
                  builder: (context) => FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Colors.black,
                      onPressed: () async {
                        _validate(context);
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ),
              SizedBox(
                height: height * .02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'You Don\'t have an account?',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "SignUpScreen");
                    },
                    child: Text(
                      ' Sign Up',
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );

  }

  void _validate(BuildContext context)async {

    if (_globalKey.currentState.validate()) {
      _globalKey.currentState.save();
        try {
          Navigator.pushNamed(context, "HomePage");
        } catch (e) {
          Scaffold.of(context).showSnackBar(SnackBar(content: Text(e.message)));
        }
      }
    }
  }


