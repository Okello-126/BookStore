import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/web_symbols_icons.dart';

class Featured extends StatefulWidget {
  Featured({Key key}) : super(key: key);

  @override
  _FeaturedState createState() => _FeaturedState();
}

int index = 1;

class _FeaturedState extends State<Featured> {
  Widget _buildContainer() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        width: 320,
        height: 590,
        child: Column(
          children: [
            Image.network(
                index == 1
                    ? 'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1535419394l/4069._SY475_.jpg'
                    : index == 2
                        ? 'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1403188280l/265525.jpg'
                        : index == 3
                            ? 'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1380212081l/18588024.jpg'
                            : index == 4
                                ? 'https://kbimages1-a.akamaihd.net/b7c6e14f-23ac-424a-989a-fcc9e7104a03/353/569/90/False/beyond-good-and-evil-136.jpg'
                                : index == 5
                                    ? 'https://kbimages1-a.akamaihd.net/8f82fae8-1936-4c2c-87c0-3b2362e9a00b/353/569/90/False/yes-to-life-ebk.jpg'
                                    : index == 6
                                        ? 'https://kbimages1-a.akamaihd.net/7bc1fade-b357-4d13-b5fd-f6944d4d0a82/353/569/90/False/change-15.jpg'
                                        : 'https://images-na.ssl-images-amazon.com/images/I/41hpq0cy8JL._SX326_BO1,204,203,200_.jpg',
                width: 320,
                height: 489,
                fit: BoxFit.fill),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                      index == 1
                          ? '2011'
                          : index == 2
                              ? '2013'
                              : index == 3
                                  ? '2004'
                                  : index == 4
                                      ? '2015'
                                      : index == 5
                                          ? '2020'
                                          : index == 6
                                              ? '2017'
                                              : '2016',
                      style: GoogleFonts.hammersmithOne(
                          fontWeight: FontWeight.bold, fontSize: 20)),
                  Text(
                      index == 1
                          ? 'Tzs 35,000'
                          : index == 2
                              ? 'Tzs 42,500'
                              : index == 3
                                  ? 'Tzs 40,000'
                                  : index == 4
                                      ? 'Tzs 39,000'
                                      : index == 5
                                          ? 'Tzs 50,000'
                                          : index == 6
                                              ? 'Tzs 48,000'
                                              : 'Tzs 41,500',
                      style: GoogleFonts.dekko(
                          color: Color(0xff9C7D12),
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                  Icon(FontAwesome5.cart_plus)
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Icon(WebSymbols.left_circle,
                      color: index == 7 ? Colors.blue : Colors.black),
                  onTap: () {
                    setState(() {
                      index == 1 ? index = 1 : index -= 1;
                    });
                  },
                ),
                InkWell(
                  child: Icon(WebSymbols.right_circle,
                      color: index == 1 ? Colors.blue : Colors.black),
                  onTap: () {
                    setState(() {
                      index == 7 ? index = 7 : index += 1;
                    });
                  },
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
