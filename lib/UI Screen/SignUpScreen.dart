import 'package:grocery_app/API/DBHelper.dart';
import 'package:grocery_app/Model/User.dart';

import 'package:flutter/material.dart';
import 'package:grocery_app/constant/Custome%20logo.dart';
import 'package:grocery_app/constant/Custome%20textfield.dart';


class SignUpScreen extends StatelessWidget {
  final GlobalKey<FormState> _globalKey= GlobalKey<FormState>();
  static String id = 'SignUp';
  String _email,_password,_name;


  @override
  Widget build(BuildContext context) {
    DBHelper database = DBHelper();
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.lightGreen,
        body: Form(
            key: _globalKey,
            child: ListView(
              children: [
                Customelogo(),
                SizedBox(
                  height: height * .05,
                ),
                CustomeTextField(
                  onClick: (value){
                    _name=value;
                  },
                  hint: 'Enter your Name',
                  icon: Icons.perm_identity,
                ),
                SizedBox(
                  height: height * .01,
                ),
                CustomeTextField(
                  onClick: (value){
                    _email=value;
                  },
                  hint: 'Enter your email',
                  icon: Icons.email,
                ),
                SizedBox(
                  height: height * .01,
                ),
                CustomeTextField(
                    onClick: (value){
                      _password=value;
                    },
                    icon: Icons.lock,
                    hint: 'Enter your Password'),
                SizedBox(
                  height: height*.05,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 120),
                  child: Builder(
                    builder:(context)=> FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: Colors.black,
                        onPressed: () async
                        {
                          if(_globalKey.currentState.validate()) {
                            _globalKey.currentState.save();
                            User s = User(_email, _password, _name);
                            database.AddNewUser(s);
                            print('The data saved');
                            Navigator.pushNamed(context, 'HomePage'); }

                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ),
                SizedBox(
                  height: height*.02,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Do have an account ?',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, SignUpScreen.id);
                      },
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, "/");
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      }
}