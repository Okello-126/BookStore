import 'package:book_store_demo_v1/bookcard.dart';
import 'package:book_store_demo_v1/relatedauthors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'bookdetails.dart';

class AuthorDetails extends StatelessWidget {
 final String authorpicture, authordescription,author;
  const AuthorDetails(this.authorpicture,this.authordescription,this.author);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
              authorpicture),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(author,
                style: GoogleFonts.hammersmithOne(
                    fontWeight: FontWeight.bold, fontSize: 24)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Text(authordescription,
                maxLines: 7,
                style: GoogleFonts.dekko(
                    fontWeight: FontWeight.normal, fontSize: 20)),
          ),
          Padding(
              padding: EdgeInsets.only(left: 28, top: 20, bottom: 10),
              child: Text('Available books',
                  style: GoogleFonts.hammersmithOne(
                      fontWeight: FontWeight.bold, fontSize: 22))),
         StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('books')
                .where('author', isEqualTo: author)
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
          Padding(
              padding: EdgeInsets.only(left: 28, bottom: 15,top:10),
              child: Text('Related Authors',
                  style: GoogleFonts.hammersmithOne(
                      fontWeight: FontWeight.bold, fontSize: 22))),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: SizedBox(
              height: 115,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  RelatedAuthor('Ryan Holiday',
                      'https://firebasestorage.googleapis.com/v0/b/real-estate-demo-v1.appspot.com/o/ryan%20holliday.png?alt=media&token=5c9c9398-8921-4b4f-8b5e-938afa9307d1'),
                  RelatedAuthor('Roger L Martin',
                      'https://firebasestorage.googleapis.com/v0/b/real-estate-demo-v1.appspot.com/o/Image%2024.png?alt=media&token=f460f717-7a00-4f11-9b46-462335c39a97'),
                  RelatedAuthor('Michael Powter',
                      'https://firebasestorage.googleapis.com/v0/b/real-estate-demo-v1.appspot.com/o/Image%2025.png?alt=media&token=94cd0973-f662-43c8-913e-a7523469d154')
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
