import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'bookcard.dart';
import 'bookdetails.dart';

class SearchAutoBiography extends StatefulWidget {
  SearchAutoBiography({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

String searchstring;
TextEditingController _controller = TextEditingController();

class _SearchState extends State<SearchAutoBiography> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Center(
            child: Container(
              width: 400,
              child: TextField(
                controller: _controller,
                autofocus: true,
                decoration: InputDecoration(
                    hintText: 'search autobiographies by title or author',
                    hintStyle: GoogleFonts.dekko(
                      fontWeight: FontWeight.normal,
                    ),
                    suffixIcon: GestureDetector(
                        child: Icon(Icons.cancel),
                        onTap: () {
                          _controller.clear();

                          setState(() {
                            searchstring = '';
                          });
                        })),
                onChanged: (value) {
                  setState(() {
                    searchstring = value.toLowerCase();
                  });
                },
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder(
                stream: searchstring == null || searchstring == ''
                    ? FirebaseFirestore.instance
                        .collection('books')
                        .where('type', isEqualTo: 'auto-biography')
                        .snapshots()
                    : FirebaseFirestore.instance
                        .collection('books')
                        .where('type', isEqualTo: 'auto-biography')
                        .where('search-index', arrayContains: searchstring)
                        .snapshots(),
                builder: (context, snapshot) {
                  return Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Wrap(
                        children:
                            List.generate(snapshot.data.docs.length, (index) {
                      DocumentSnapshot book = snapshot.data.docs[index];
                      return GestureDetector(
                        child: BookCard('no',
                            book['name'], book['price'], book['image']),

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
                                        book['author-description'],book['id'],book['name']
                                        )));
                          },
                      );
                    })),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
