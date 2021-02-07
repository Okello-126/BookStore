import 'package:book_store_demo_v1/bookcard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bookdetails.dart';

class CartItems extends StatefulWidget {
  CartItems({Key key}) : super(key: key);

  @override
  _CartItemsState createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        //  leading: Icon(Icons.arrow_back, color: Colors.black),
          title: Text('Your Cart',
              style: GoogleFonts.dekko(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
        ),
        body: SingleChildScrollView(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('cart').snapshots(),
            builder: (context, snapshot) {
              return Container(
                padding: EdgeInsets.only(top: 10, bottom: 20),
                child: Wrap(
                    runSpacing: 10,
                    children: List.generate(snapshot.data.docs.length, (index) {
                      DocumentSnapshot book = snapshot.data.docs[index];
                      return BookCard(
                          'yeah', book['title'], book['price'], book['image']);
                    })),
              );
            },
          ),
        ),
      ),
    );
  }
}
