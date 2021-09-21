import 'package:flutter/material.dart';

class Customelogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40),
      child: Container(
        height: MediaQuery.of(context).size.height * .25,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Image(
              height: 150,
              width: 150,
              image: AssetImage('images/groceries.png'),
            ),
            Positioned(
              bottom: 0,
              child: Text(
                'Grocery',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 25,
                ),
              ),
            )
          ],
        ),
      ),
    );

  }
}
