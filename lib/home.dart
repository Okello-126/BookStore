import 'package:book_store_demo_v1/clubs.dart';
import 'package:book_store_demo_v1/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'bookcard.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu, color: Colors.black),
          backgroundColor: Colors.white,
          title: Text(
            'BookStore',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(
                right: 8,
              ),
              child: Container(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.notifications_none, color: Colors.black),
                    Icon(Icons.event_note, color: Colors.black),
                    GestureDetector(
                      child: Icon(Icons.people, color: Colors.black),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => Clubs(),
                        ));
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Search()));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width - 70,
                    height: 50,
                    color: Color(0xffd3d3d3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('search by title or author',
                              style: GoogleFonts.dekko(fontSize: 18)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.search),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18, left: 10),
                child: Text('Recommended for you',
                    style: GoogleFonts.hammersmithOne(
                        fontWeight: FontWeight.normal, fontSize: 22)),
              ),
              SizedBox(height: 10),
              Wrap(
                children: [
                  GestureDetector(
                    onTap: () {
                      /*  Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookDetails(

                            ),
                          )); */
                    },
                    child: BookCard('no', 'Born A Crime', 'Tzs 20,000',
                        'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1473867911l/29780253.jpg'),
                  ),
                  GestureDetector(
                    onTap: () async {
                      String name =
                          'How to Consciously Design Your Ideal Future';
                      List splitlist = name.split(" ");
                      List indexlist = [];

                      for (int i = 0; i < splitlist.length; i++) {
                        for (int j = 0; j < splitlist[i].length + 1; j++) {
                          indexlist
                              .add(splitlist[i].substring(0, j).toLowerCase());
                        }
                      }

                      List list1 = indexlist.toSet().toList();
                      print(list1);

                      String author = 'Benjamin Hardy';
                      List splitlist2 = author.split(" ");
                      List indexlist2 = [];

                      for (int i = 0; i < splitlist2.length; i++) {
                        for (int j = 0; j < splitlist2[i].length + 1; j++) {
                          indexlist2
                              .add(splitlist2[i].substring(0, j).toLowerCase());
                        }
                      }

                      List list2 = indexlist2.toSet().toList();
                      print(list2);

                      await FirebaseFirestore.instance
                          .collection('books11')
                          .add({
                        'name': name,
                        'image':
                            'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1489559230l/29489179.jpg',
                        'price': 'Tzs 23,000',
                        'pages': '321',
                        'type': 'business',
                        'author': author,
                        'author-iamge-large':
                            'https://firebasestorage.googleapis.com/v0/b/bookstore-demo-v1.appspot.com/o/ben%20large%20(2).png?alt=media&token=8115a414-dc99-4784-9d45-1576f4e92c61',
                        'author-image':
                            'https://firebasestorage.googleapis.com/v0/b/bookstore-demo-v1.appspot.com/o/ben%20small.png?alt=media&token=b581302a-1524-47eb-97ac-943ed2db3675',
                        'author-description':
                            'Walter Isaacson, the CEO of the Aspen Institute, has been chairman of CNN and the managing editor of "Time" magazine. He is the author of "Steve Jobs"; "Einstein: His Life and Universe"; "Benjamin Franklin: An American Life"; and "Kissinger: A Biography," and the coauthor of "The Wise Men: Six Friends and the World They Made." He lives in Washington, DC.',
                        'book-description':
                            ' At a time when America is seeking ways to sustain its innovative edge, Jobs stands as the ultimate icon of inventiveness and applied imagination. He knew that the best way to create value in the twenty-first century was to connect creativity with technology. He built a company where leaps of the imagination were combined with remarkable feats of engineering. Although Jobs cooperated with the author, he asked for no control over what was written. He put nothing off-limits. He encouraged the people he knew to speak honestly. He himself spoke candidly about the people he worked with and competed against. His friends, foes, and colleagues offer an unvarnished view of the passions, perfectionism, obsessions, artistry, devilry, and compulsion for control that shaped his approach to business and the innovative products that resulted. His tale is instructive and cautionary, filled with lessons about innovation, character, leadership, and values. Steve Jobs is the inspiration for the movie of the same name starring Michael Fassbender, Kate Winslet, Seth Rogen, and Jeff Daniels, directed by Danny Boyle with a screenplay by Aaron Sorkin.',
                        'year': '2011',
                        'reviews-names': ['Jeniffer', 'Sarah Williams'],
                        'reviews': [
                          'The author is very charismatic and if you\'re going to read this book, I would recommend the audiobook since he narrates it!',
                          'If you\'re going to read this book, definitely listen to the audio version. Trevor Noah is one of the most effortless narrators I\'ve ever listened to. It genuinely feels like he is sitting down with you and telling you his life story.'
                        ],
                        'reviews-pics': [
                          'https://images.gr-assets.com/users/1602128191p2/33411728.jpg',
                          'https://images.gr-assets.com/users/1453257504p2/27442154.jpg'
                        ],
                        'tags': ['productivity'],
                        'name-search-index': list1,
                        'author-search-index': list2,
                        'search-index': List.from(list1)..addAll(list2),
                        'quotes': [
                          '“We tell people to follow their dreams, but you can only dream of what you can imagine, and, depending on where you come from, your imagination can be quite limited.”',
                          '“I don’t regret anything I’ve ever done in life, any choice that I’ve made. But I’m consumed with regret for the things I didn’t do, the choices I didn’t make, the things I didn’t say. We spend so much time being afraid of failure, afraid of rejection. But regret is the thing we should fear most. Failure is an answer. Rejection is an answer. Regret is an eternal question you will never have the answer to. “What if…” “If only…” “I wonder what would have…” You will never, never know, and it will haunt you for the rest of your days.”',
                          '“Nelson Mandela once said, If you talk to a man in a language he understands, that goes to his head. If you talk to him in his language, that goes to his heart. He was so right. When you make the effort to speak someone else\'s language, even if it\'s just basic phrases here and there, you are saying to them, I understand that you have a culture and identity that exists beyond me. I see you as a human being”'
                        ],
                      });
                    },
                    child: BookCard(
                        'no',
                        'The Design of Everyday Things',
                        'Tzs 18,500',
                        'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1442460745l/840._SY475_.jpg'),
                  ),
                  GestureDetector(
                    onTap: () async {
                      String name = 'Mastery';
                      List splitlist = name.split(" ");
                      List indexlist = [];

                      for (int i = 0; i < splitlist.length; i++) {
                        for (int j = 0; j < splitlist[i].length + 1; j++) {
                          indexlist
                              .add(splitlist[i].substring(0, j).toLowerCase());
                        }
                      }

                      List list1 = indexlist.toSet().toList();
                      print(list1);

                      String name2 = 'Robert Greene';
                      List splitlist2 = name2.split(" ");
                      List indexlist2 = [];

                      for (int i = 0; i < splitlist2.length; i++) {
                        for (int j = 0; j < splitlist2[i].length + 1; j++) {
                          indexlist2
                              .add(splitlist2[i].substring(0, j).toLowerCase());
                        }
                      }

                      List list2 = indexlist2.toSet().toList();
                      print(list2);

                      await FirebaseFirestore.instance
                          .collection('books11')
                          .doc('HNbSgLisfCtp6SJBFUDM')
                          .update({
                        'quotes': [
                          '“People around you, constantly under the pull of their emotions, change their ideas by the day or by the hour, depending on their mood. You must never assume that what people say or do in a particular moment is a statement of their permanent desires.”',
                          '“The future belongs to those who learn more skills and combine them in creative ways.”',
                          '“Think of it this way: There are two kinds of failure. The first comes from never trying out your ideas because you are afraid, or because you are waiting for the perfect time. This kind of failure you can never learn from, and such timidity will destroy you. The second kind comes from a bold and venturesome spirit. If you fail in this way, the hit that you take to your reputation is greatly outweighed by what you learn. Repeated failure will toughen your spirit and show you with absolute clarity how things must be done.”'
                        ]
                      });
                    },
                    child: BookCard('no', 'The Flavour Bible', 'Tzs 35,000',
                        'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1390269927l/4443485.jpg'),
                  ),
                  BookCard('no', 'In My Own Words', 'Tzs 25,000',
                      'https://kbimages1-a.akamaihd.net/5ba69dbf-692f-419e-8e7c-f3d3e6b526e9/353/569/90/False/my-own-words.jpg')
                ],
              ),
              SizedBox(height: 20)
            ],
          ),
        ));
  }
}
