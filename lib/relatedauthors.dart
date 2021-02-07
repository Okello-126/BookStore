import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RelatedAuthor extends StatelessWidget {
  final String name, picture;
  const RelatedAuthor(this.name, this.picture);

  @override
  Widget build(BuildContext context) {
    double containerwidth = name.length.toDouble() *7.58;
    print(containerwidth);
    return Container(
      // padding: EdgeInsets.only(right:containerwidth.toDouble()),
      width: containerwidth*2.5,
      height: 109,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Stack(
          children: [
            Positioned(
              top: 20,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xff686868),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                height: 78,
                width: containerwidth*2.3,
              ),
            ),
            Positioned(
              left: 10,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                child: Image.network(picture),
              ),
            ),
            Positioned(
              top: 50,
              left: 100,
              child: Text(name,
                  style: GoogleFonts.dekko(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 20)),
            )
          ],
        ),
      ),
    );
  }
}
