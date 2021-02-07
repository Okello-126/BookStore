import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'autobiography.dart';
import 'fiction.dart';

class Genre extends StatefulWidget {
  Genre({Key key}) : super(key: key);

  @override
  _GenreState createState() => _GenreState();
}

class _GenreState extends State<Genre> {
  Widget _buildgenre(String genre, Color color, String image) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, left: 40, right: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            elevation: 10,
            shape: CircleBorder(),
            child: Container(
                width: 100,
                height: 100,
                child: Image.network(image, color: color)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(genre,
                style: GoogleFonts.dekko(
                    fontWeight: FontWeight.bold, fontSize: 20)),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Autobiography(),
              ));
        },
        child: _buildgenre('Autobiography', Colors.black,
            'https://firebasestorage.googleapis.com/v0/b/real-estate-demo-v1.appspot.com/o/biography%205.png?alt=media&token=c8d0b50f-ceb3-4895-b2dd-71506c1a4095'),
      ),
      GestureDetector(
       
        child: _buildgenre('Philosophy', Color(0xff471618),
            'https://firebasestorage.googleapis.com/v0/b/real-estate-demo-v1.appspot.com/o/philosophy%20(2).png?alt=media&token=84daacb1-671e-4709-b481-83a8029abf90'),
      ),
      _buildgenre('Productivity', Color(0xff6E6E6E),
          'https://firebasestorage.googleapis.com/v0/b/real-estate-demo-v1.appspot.com/o/productivity.png?alt=media&token=9142c480-e9a3-49ae-bead-8f430c5802f8'),
      _buildgenre('Strategy', Color(0xff41511B),
          'https://firebasestorage.googleapis.com/v0/b/real-estate-demo-v1.appspot.com/o/strategy.png?alt=media&token=68ebb6c6-5f69-4ece-9962-f3122607157f'),
      _buildgenre('Relationships', Color(0xffA08421),
          'https://firebasestorage.googleapis.com/v0/b/real-estate-demo-v1.appspot.com/o/friends.png?alt=media&token=da2e58ed-10bb-414b-be79-a66c832a5699'),
      GestureDetector(
          onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Fiction(),
              ));
        },
        child: _buildgenre('Fiction', Colors.black,
            'https://img.icons8.com/wired/64/000000/harry-potter.png'),
      ),
      _buildgenre('Cook-books', Color(0xff7C7755),
          'https://firebasestorage.googleapis.com/v0/b/real-estate-demo-v1.appspot.com/o/cookbook.png?alt=media&token=b0b41564-b952-458f-80d8-4a26f1fde283'),
      _buildgenre('Art & Design', Color(0xff252E72),
          'https://firebasestorage.googleapis.com/v0/b/real-estate-demo-v1.appspot.com/o/art%20and%20design.png?alt=media&token=14144ffc-b695-4c06-b832-f7497336a725')
    ]);
  }
}
