import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'bookdetails.dart';

class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

String searchstring;
TextEditingController _controller = TextEditingController();

class _SearchState extends State<Search> {
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
                    hintText: 'search by title or author',
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
                    ? FirebaseFirestore.instance.collection('books').snapshots()
                    : FirebaseFirestore.instance
                        .collection('books')
                        .where('search-index', arrayContains: searchstring)
                        .snapshots(),
                builder: (context, snapshot) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot books = snapshot.data.docs[index];
                      return Padding(
                        padding:
                             EdgeInsets.only(top: 8, left: 10, right: 15),
                        child: GestureDetector(
                          child: Container(
                            width: 360,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            child: Stack(
                              children: [
                                Image.network(books['image'],width:70,height:100,fit:BoxFit.fill),
                                Positioned(left:70,
                                  child: Padding(
                                    padding:  EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:  EdgeInsets.all(8.0),
                                          child: Text(
                                              books['name']
                                                  .toString()
                                                  .toUpperCase(),
                                              style: GoogleFonts.hammersmithOne(
                                                fontSize: 22,
                                              )),
                                        ),
                                        Text(books['author'],
                                            style:
                                                GoogleFonts.dekko(fontSize: 20))
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BookDetails(
                                        books['image'],
                                        books['author'],
                                        books['year'],
                                        books['pages'],
                                        books['price'],
                                        books['book-description'],
                                        books['quotes'],
                                        books['reviews'],
                                        books['reviews-names'],
                                        books['reviews-pics'],
                                        books['author-iamge-large'],
                                        books['author-description'],books['id'],books['name']
                                        )));
                          },
                        ),
                      );
                    },
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
