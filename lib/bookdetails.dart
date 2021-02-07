import 'package:book_store_demo_v1/bookcard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import 'authordetails.dart';
import 'cart.dart';

class BookDetails extends StatefulWidget {
  final String image,
      author,
      year,
      pages,
      price,
      bookdescription,
      authorpicture,
      authordescription,
      id,title;
  final List quotes, reviews, reviewspics, reviewsnames;

  BookDetails(
      this.image,
      this.author,
      this.year,
      this.pages,
      this.price,
      this.bookdescription,
      this.quotes,
      this.reviews,
      this.reviewsnames,
      this.reviewspics,
      this.authorpicture,
      this.authordescription,
      this.id,this.title);

  @override
  _BookDetailsState createState() => _BookDetailsState();
}

Cart cart = Cart();

class _BookDetailsState extends State<BookDetails> {
  Widget _buildQuotes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Text('Quotes',
              style: GoogleFonts.hammersmithOne(
                  color: Color(0xff837A05),
                  fontWeight: FontWeight.normal,
                  fontSize: 24)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Container(
            color: Color(0xffF5F3F3),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(widget.quotes[0],
                  style: GoogleFonts.dekko(
                      fontWeight: FontWeight.bold, fontSize: 20)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Container(
            color: Color(0xffF5F3F3),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(widget.quotes[1],
                  style: GoogleFonts.dekko(
                      fontWeight: FontWeight.bold, fontSize: 20)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Container(
            color: Color(0xffF5F3F3),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(widget.quotes[2],
                  style: GoogleFonts.dekko(
                      fontWeight: FontWeight.bold, fontSize: 20)),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 520,
              child: Stack(
                children: [
                  Container(
                      width: 411,
                      height: 500,
                      color: Color(0xff636363),
                      child: Padding(
                          padding: EdgeInsets.only(top: 53),
                          child: Image.network(widget.image))),
                  
                  
                  Positioned(
                    bottom: 0,
                    right: 70,
                    child: GestureDetector(
                      child:   cart.ids.contains(widget.id)?
                      
                      Card(
                          elevation: 5,
                          shape: CircleBorder(),
                          child: Container(
                            decoration: BoxDecoration(
                                color:   Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            width: 50,
                            height: 50,
                            child: Image.network('https://firebasestorage.googleapis.com/v0/b/bookstore-demo-v1.appspot.com/o/cart.png?alt=media&token=291b40e3-b97f-42cb-bb28-082885b65bfd',
                                color:Color(0xff5D4903)),
                          )):
                          

                            Card(
                          elevation: 5,
                          shape: CircleBorder(),
                          child: Container(
                            decoration: BoxDecoration(
                                color:  Color(0xffD6CAB0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            width: 50,
                            height: 50,
                            child: Icon(FontAwesome5.cart_plus,
                                color:
                                     Colors.black),
                          ))
                          
                          ,
                      onTap: () async {
                        /*  cart.cartlist.add(
                              BookCard('hurrat', widget.price, widget.image));*/
                        setState(() {
                          cart.ids.add(widget.id);
                        });

                        await FirebaseFirestore.instance
                            .collection('cart')
                            .doc(widget.id)
                            .set({
                          'title': widget.title,
                          'price': widget.price,
                          'image': widget.image
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text('Author :',
                      style: GoogleFonts.dekko(
                          fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(widget.author,
                      style: GoogleFonts.hammersmithOne(
                          fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                SizedBox(width: 10),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AuthorDetails(
                                  widget.authorpicture,
                                  widget.authordescription,
                                  widget.author)));
                    },
                    child: Image.network(
                        'https://img.icons8.com/fluent-systems-filled/24/000000/external-link-squared.png'))
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text('Year :',
                      style: GoogleFonts.dekko(
                          fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(widget.year,
                      style: GoogleFonts.hammersmithOne(
                          fontWeight: FontWeight.bold, fontSize: 20)),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text('Pages :',
                      style: GoogleFonts.dekko(
                          fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(widget.pages,
                      style: GoogleFonts.hammersmithOne(
                          fontWeight: FontWeight.bold, fontSize: 20)),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text('Price :',
                      style: GoogleFonts.dekko(
                          fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(widget.price,
                      style: GoogleFonts.dekko(
                          color: Color(0xff9C7D12),
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                )
              ],
            ),
            Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                  child: Text(widget.bookdescription,
                      maxLines: 7,
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.dekko(
                          fontWeight: FontWeight.normal, fontSize: 20)),
                ),
                Positioned(bottom: 5, right: 30, child: Icon(Icons.read_more))
              ],
            ),
            widget.quotes[0] == '' ? Container() : _buildQuotes(),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
              child: Text('Reviews',
                  style: GoogleFonts.hammersmithOne(
                      color: Color(0xff837A05),
                      fontWeight: FontWeight.normal,
                      fontSize: 24)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Container(
                width: 395,
                //height: 145,

                decoration: BoxDecoration(
                    color: Color(0xFFEBE8E8),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                              radius: 40,
                              backgroundImage:
                                  NetworkImage(widget.reviewspics[0])),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Text(widget.reviewsnames[0],
                              style: GoogleFonts.dekko(
                                  fontWeight: FontWeight.bold, fontSize: 24)),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(widget.reviews[0],
                          //  maxLines: 5,
                          style: GoogleFonts.dekko(
                              fontWeight: FontWeight.normal, fontSize: 20)),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Container(
                width: 395,
                //height: 145,
                decoration: BoxDecoration(
                    color: Color(0xFFEBE8E8),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                              radius: 40,
                              backgroundImage:
                                  NetworkImage(widget.reviewspics[1])),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Text(widget.reviewsnames[1],
                              style: GoogleFonts.dekko(
                                  fontWeight: FontWeight.bold, fontSize: 24)),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(widget.reviews[1],
                          // maxLines: 5,
                          style: GoogleFonts.dekko(
                              fontWeight: FontWeight.normal, fontSize: 20)),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20)
          ],
        )),
        /*  floatingActionButton: Align(
          widthFactor: 3,
          heightFactor: 9,
          child: FloatingActionButton(
            elevation: 3,
            onPressed: () {},
            backgroundColor: Color(0xffD6CAB0),
            child: Icon(FontAwesome5.cart_plus, color: Colors.black),
          ),
        ), */
      ),
    );
  }
}
