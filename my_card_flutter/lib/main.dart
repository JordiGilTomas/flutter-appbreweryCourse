import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                  backgroundImage: AssetImage('images/avatar.jpg'),
                  radius: 50.0),
              SizedBox(width: double.infinity),
              Text(
                'Jordi Gil',
                style:
                    GoogleFonts.pacifico(color: Colors.white, fontSize: 30.0),
              ),
              SizedBox(height: 5.0),
              Text(
                'flutter developer'.toUpperCase(),
                style: GoogleFonts.sourceSansPro(
                    color: Colors.teal[100],
                    letterSpacing: 5.0,
                    fontWeight: FontWeight.w600),
              ),
              Divider(
                  color: Colors.teal.shade100,
                  thickness: 1.0,
                  indent: 50.0,
                  endIndent: 50.0),
              SizedBox(height: 20.0),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  dense: true,
                  leading: Icon(Icons.phone, color: Colors.teal, size: 20.0),
                  title: Text(
                    '+34 100 564 694',
                    style: GoogleFonts.sourceSansPro(
                        color: Colors.teal.shade900, fontSize: 17.0),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  dense: true,
                  leading: Icon(Icons.email, color: Colors.teal, size: 20.0),
                  title: Text(
                    'jordi.gil@email.com',
                    style: GoogleFonts.sourceSansPro(
                        color: Colors.teal.shade900, fontSize: 17.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
