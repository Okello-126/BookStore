import 'package:book_store_demo_v1/authors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'featured.dart';
import 'genres.dart';

class Cards extends StatefulWidget {
  Cards({Key key}) : super(key: key);

  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xffD6CAB0),
            toolbarHeight: 60,
            
            bottom: TabBar(
         
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width:6),
                insets: EdgeInsets.symmetric(horizontal: 13)
              ),
              onTap: (index) {
                setState(() {
                   switch (index){
                  case 0:

                }
                });
               
              },
              tabs: [
                Tab(
                  child: Text('GENRES',
                      style: GoogleFonts.hammersmithOne(
                          fontWeight: FontWeight.normal,
                          fontSize: 22,
                          color: Colors.black)),
                ),
                Tab(
                  child: Text('AUTHORS',
                      style: GoogleFonts.hammersmithOne(
                          fontWeight: FontWeight.normal,
                          fontSize: 22,
                          color: Colors.black)),
                ),
                Tab(
                  child: Text('FEATURED',
                      style: GoogleFonts.hammersmithOne(
                          fontWeight: FontWeight.normal,
                          fontSize: 22,
                          color: Colors.black)),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Genre(),
              Authors(),
              Featured()
            ],
          )),
    );
  }
}
