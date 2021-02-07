import 'package:book_store_demo_v1/search-autobiography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'bookcard.dart';
import 'bookdetails.dart';

class Autobiography extends StatefulWidget {
  Autobiography({Key key}) : super(key: key);

  @override
  _AutobiographyState createState() => _AutobiographyState();
}

class _AutobiographyState extends State<Autobiography> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation:1,
          automaticallyImplyLeading: true,
          backgroundColor: Colors.white10,
          title: Text('Auto-biography',
              style: GoogleFonts.dekko(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 24)),
          actions: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: GestureDetector(
                child: Container(
                    width: 57,
                    height: 51,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Icon(Icons.search)),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchAutoBiography()));
                },
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('books')
                .where('type', isEqualTo: 'auto-biography')
                .snapshots(),
            builder: (context, snapshot) {
              return Container(
                padding: EdgeInsets.only(top: 10),
                child: Wrap(
                    children: List.generate(snapshot.data.docs.length, (index) {
                  DocumentSnapshot book = snapshot.data.docs[index];
                  return GestureDetector(child: BookCard('no',book['name'], book['price'], book['image']),
                  
                  
                   onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BookDetails(
                                        book['image'],
                                        book['author'],
                                        book['year'],
                                        book['pages'],
                                        book['price'],
                                        book['book-description'],
                                        book['quotes'],
                                        book['reviews'],
                                        book['reviews-names'],
                                        book['reviews-pics'],
                                        book['author-iamge-large'],
                                        book['author-description'],
                                        book['id'],book['name']
                                        )));
                          },
                  );
                })),
              );
            },
          ),
        ));
  }
}
