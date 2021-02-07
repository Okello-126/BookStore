import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bookcard.dart';

class Fiction extends StatefulWidget {
  Fiction({Key key}) : super(key: key);

  @override
  _FictionState createState() => _FictionState();
}

class _FictionState extends State<Fiction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          automaticallyImplyLeading: true,
          backgroundColor: Colors.white10,
          title: Text('Fiction',
              style: GoogleFonts.dekko(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 24)),
          actions: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                  width: 57,
                  height: 51,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Icon(Icons.search)),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 10),
              Wrap(
                children: [
                  BookCard('no','Gone Girl', 'Tzs 20,000',
                      'https://pyxis.nymag.com/v1/imgs/fa7/b2d/ccaa3e1625ea97d88b3fdece371177fc74-gone-girl.rdeep-vertical.w245.jpg'),
                  BookCard('no','Let me tell you about a man i knew', 'Tzs 24,000',
                      'https://kbimages1-a.akamaihd.net/250cd458-985f-4a6d-b29d-58b3086f81fd/353/569/90/False/let-me-tell-you-about-a-man-i-knew-2.jpg'),
                  BookCard('no','A Prayer for Owen Meany', 'Tzs 30,500',
                      'https://kbimages1-a.akamaihd.net/d2ae2bb5-0d1c-4109-a6d9-b7a9f79604bc/353/569/90/False/a-prayer-for-owen-meany-1.jpg'),
                  BookCard('no','Every Man for Himself', 'Tzs 29,000',
                      'https://kbimages1-a.akamaihd.net/5bfbbae4-109b-4739-b3c3-10fdcc15ee78/353/569/90/False/every-man-for-himself-1.jpg'),
                  BookCard('no','Not as A Stranger', 'Tzs 49,000',
                      'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1437663361l/1877857._SY475_.jpg'),
                  BookCard('no','The Grapes of Wrath', 'Tzs 40,000',
                      'https://kbimages1-a.akamaihd.net/acfa0714-60ee-47d3-9455-35b1e73aad35/353/569/90/False/the-grapes-of-wrath-15.jpg'),
                  BookCard('no','Strange Fruit', 'Tzs 18,000',
                      'https://kbimages1-a.akamaihd.net/8edcd978-1704-426b-ba9f-1138f9d85997/353/569/90/False/strange-fruit-22.jpg'),
                  BookCard('no','The Five People You Meet in Heaven', 'Tzs 32,000',
                      'https://kbimages1-a.akamaihd.net/bcf7584b-a882-4c56-96e9-9804a8e56ffb/353/569/90/False/the-five-people-you-meet-in-heaven.jpg'),
                  BookCard('no','The Blind Assassin', 'Tzs 30,500',
                      'https://kbimages1-a.akamaihd.net/9ff622d3-afc8-4d72-afce-16bd04fa61fd/353/569/90/False/the-blind-assassin.jpg'),
                  BookCard('no','East of Eden', 'Tzs 35,500',
                      'https://kbimages1-a.akamaihd.net/7870c21d-467f-4dc3-9739-01e62e55e505/353/569/90/False/east-of-eden-21.jpg')
                ],
              ),
            ],
          ),
        ));
  }
}
