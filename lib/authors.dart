import 'package:book_store_demo_v1/authordetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Authors extends StatefulWidget {
  Authors({Key key}) : super(key: key);

  @override
  _AuthorsState createState() => _AuthorsState();
}

class _AuthorsState extends State<Authors> {
  Widget _buildtags(String tag) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(tag,
          style: GoogleFonts.dekko(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xffCFA71F))),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> list1 = [_buildtags('thriller'), _buildtags('kids')];

    List<Widget> list2 = [
      _buildtags('productivity'),
      _buildtags('memory'),
      _buildtags('learning')
    ];

    List<Widget> list3 = [_buildtags('investments'), _buildtags('banking')];

    Widget _buildAuthors(String name, List tags, String image) {
      return Padding(
        padding: const EdgeInsets.only(right: 18.0),
        child: Container(
          width: 384,
          height: 78,
          decoration: BoxDecoration(
              color: Color(0xffF2EEF7),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Row(
            children: [
              Container(
                  width: 83,
                  height: 78,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                    child: Image.network(image),
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(name,
                        style: GoogleFonts.hammersmithOne(
                            fontWeight: FontWeight.normal, fontSize: 20)),
                  ),
                  tags.length == 1
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(tags[0],
                              style: GoogleFonts.dekko(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffCFA71F))))
                      : tags.length == 2
                          ? Row(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(tags[0],
                                        style: GoogleFonts.dekko(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xffCFA71F)))),
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(tags[1],
                                        style: GoogleFonts.dekko(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xffCFA71F))))
                              ],
                            )
                          : Row(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(tags[0],
                                        style: GoogleFonts.dekko(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xffCFA71F)))),
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(tags[1],
                                        style: GoogleFonts.dekko(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xffCFA71F)))),
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(tags[2],
                                        style: GoogleFonts.dekko(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xffCFA71F))))
                              ],
                            )
                ],
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('authors').snapshots(),
            builder: (context, snapshot) {
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot author = snapshot.data.docs[index];

                  return Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 10),
                    child: _buildAuthors(
                        author['name'], author['tags'], author['small-pic']),
                  );
                },
              );
            },
          )
        ]),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 30, bottom: 10),
          child: Container(
              width: 57,
              height: 57,
              decoration: BoxDecoration(
                  color: Color(0xffD6CAB0),
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              child: Icon(Icons.search)),
        ),
      ),
    );
  }
}
