import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Profile extends StatelessWidget {
  const Profile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          color: Colors.white,
          elevation: 5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40)
          ),
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image.asset(
            "assets/images/profile.png",
            height: 130,
            width: 120,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          "Bakari Potter",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              textStyle: TextStyle(fontSize: 24)
          ),
        ),
        Text(
          "@llastkrakw",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w200,
              textStyle: TextStyle(fontSize: 12)
          ),
        ),
      ],
    );
  }
}