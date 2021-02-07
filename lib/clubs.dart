import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Clubs extends StatelessWidget {
  const Clubs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFBDB98A),
        title: Text('Book Clubs',
            style: GoogleFonts.dekko(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5),
              child: Text(
                  'Join other reading enthusiasts who read the same book at the same time and then come online / at a local place to discuss it.',
                  style: GoogleFonts.dekko(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 20)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text('Start a group',
                      style: GoogleFonts.dekko(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(Icons.forward, color: Colors.black),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Available Groups',
                  style: GoogleFonts.hammersmithOne(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24)),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Our Shared Shelf',
                      style: GoogleFonts.dekko(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 24)),
                ),
                SizedBox(
                  width: 100,
                ),
                Image.network(
                    'https://img.icons8.com/ios-filled/30/000000/conference-call.png'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20.0),
                  child: Text('8',
                      style: GoogleFonts.hammersmithOne(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 24)),
                ),
              ],
            ),

            Padding(
               padding: const EdgeInsets.symmetric(horizontal:10.0),
              child: Image.network('https://firebasestorage.googleapis.com/v0/b/bookstore-demo-v1.appspot.com/o/Group%202.png?alt=media&token=50a14459-9b56-477f-a325-3cb5569e9c46'),
            ),
   SizedBox(height:20),
 Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Monthly Book Readers',
                      style: GoogleFonts.dekko(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 24)),
                ),
                SizedBox(
                  width: 80,
                ),
                Image.network(
                    'https://img.icons8.com/ios-filled/30/000000/conference-call.png'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20.0),
                  child: Text('28',
                      style: GoogleFonts.hammersmithOne(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 24)),
                ),
              ],
            ),

            Padding(
               padding: const EdgeInsets.symmetric(horizontal:10.0),
              child: Image.network('https://firebasestorage.googleapis.com/v0/b/bookstore-demo-v1.appspot.com/o/Group%209.png?alt=media&token=431f4faa-4ca8-4222-8d1a-bd2e099326c5'),
            ),
   SizedBox(height:20),
             Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('The Grown-up Learners',
                      style: GoogleFonts.dekko(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 24)),
                ),
                SizedBox(
                  width: 70,
                ),
                Image.network(
                    'https://img.icons8.com/ios-filled/30/000000/conference-call.png'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20.0),
                  child: Text('30',
                      style: GoogleFonts.hammersmithOne(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 24)),
                ),
              ],
            ),

            Padding(
               padding: const EdgeInsets.symmetric(horizontal:10.0),
              child: Image.network('https://firebasestorage.googleapis.com/v0/b/bookstore-demo-v1.appspot.com/o/Group%202.png?alt=media&token=50a14459-9b56-477f-a325-3cb5569e9c46'),
            ),
            SizedBox(height:20)
          ],
        ),
      ),
    );
  }
}
