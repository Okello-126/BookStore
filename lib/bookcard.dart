import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookCard extends StatefulWidget {
  final String title, image, price;
  final String ifincart;
  BookCard(this.ifincart, this.title, this.price, this.image);

  @override
  _BookCardState createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, bottom: 5),
      child: Container(
        width: 182,
        height: 290,
        color: Colors.white10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(widget.image,
                  width: 180,
                  height: 202,

                  /*      color: Color.fromRGBO(255, 255, 255, 0.5),
  colorBlendMode: BlendMode.modulate, */

                  fit: BoxFit.cover),
            ),
            SizedBox(
                height: 27,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(widget.title,
                          style: GoogleFonts.dekko(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(widget.price,
                  style: GoogleFonts.dekko(
                      color: Color(0xff9C7D12),
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
            ),
            widget.ifincart == 'yeah'
                ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 33,
                        color: Colors.blueGrey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical:3,horizontal:5),
                          child: Text('BUY NOW',
                              style: GoogleFonts.hammersmithOne(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 22)),
                        ),
                      ),

                      Image.network('https://firebasestorage.googleapis.com/v0/b/bookstore-demo-v1.appspot.com/o/remove-from-cart.png?alt=media&token=082d6965-a53d-4989-afc5-3ddbdfcc9377')
                    ],
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
