import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Pins extends StatelessWidget {

  String _image;
  String _number;


  Pins(this._image, this._number);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25)
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(5, 8, 5, 8),
        width: 60,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(_image, width: 30, height: 30,),
            Text(
              _number,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  textStyle: TextStyle(fontSize: 12)
              ),
            ),
          ],
        ),
      ),
    );
  }
}