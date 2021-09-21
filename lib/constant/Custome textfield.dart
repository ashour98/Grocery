import 'package:flutter/material.dart';


class CustomeTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final Function onClick;
  String _errorMessage(String str) {
    switch (hint) {
      case 'Enter your email':
        return 'Email is Empty!';
      case 'Enter your Name':
        return 'Name is Empty!';
      case 'Enter your Password':
        return 'Password is Empty!';
    }
  }

  CustomeTextField({@required this.onClick,@required this.icon, @required this.hint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty)
            return _errorMessage(hint);
        },
        onSaved: onClick,
        obscureText: hint== 'Enter your Password' ? true: false ,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.lightGreen,
          ),
          hintText: hint,
          filled: true,
          fillColor: Colors.amber,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.white)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.white)),
        ),
      ),
    );
  }
}
