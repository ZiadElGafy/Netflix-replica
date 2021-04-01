import 'dart:math';
import 'package:flutter/material.dart';
import 'carrosellTile.dart';
import 'MoviePage.dart';
import 'SearchPage.dart';
import 'FavoritesPage.dart';
import 'MorePage.dart';
import 'ListViewTile.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MovieApp());
}

//MAKESHIFT DATABASE(MAPS)
Map sonic = {
  'id': 0,
  'isFav': false,
  'rating': 0.0,
  'name': 'sonic',
  'displayName': 'Sonic',
  'imdbrating': '6.5',
  'rottenrating': '6.3',
  'match': '91%',
  'releaseYear': '2019',
  'titleFontSize': 25.0,
  'played': false,
  'datePlayed': "",
  'link':
      "https://www.joblo.com/assets/images/joblo/posters/2020/01/sonic_the_hedgehog_poster3_thumb.jpg",
};
var starWars = {
  'id': 1,
  'isFav': false,
  'rating': 0,
  'name': 'starWars',
  'displayName': 'Star Wars',
  'imdbrating': '8.3',
  'rottenrating': '9.4',
  'match': '94%',
  'releaseYear': '1997',
  'titleFontSize': 25.0,
  'played': false,
  'datePlayed': "",
  'link':
      "https://www.joblo.com/assets/images/joblo/posters/2019/08/star-wars-rise-of-skywalker-poster-2_thumb.jpg",
};
var onward = {
  'id': 2,
  'isFav': false,
  'rating': 0,
  'name': 'onward',
  'displayName': 'Onward',
  'imdbrating': '5.9',
  'rottenrating': '6.1',
  'match': '83%',
  'releaseYear': '2019',
  'titleFontSize': 25.0,
  'played': false,
  'datePlayed': "",
  'link':
      "https://www.joblo.com/assets/images/joblo/posters/2019/05/onward_xlga_thumb.jpg",
};
var noTimeToDie = {
  'id': 3,
  'isFav': false,
  'rating': 0,
  'name': 'noTimeToDie',
  'displayName': 'No Time To Die',
  'imdbrating': '7.2',
  'rottenrating': '7.4',
  'match': '71%',
  'releaseYear': '2020',
  'titleFontSize': 23.0,
  'played': false,
  'datePlayed': "",
  'link':
      "https://www.joblo.com/assets/images/joblo/posters/2020/09/No-Time-to-Die-November-poster_thumb.jpg",
};
var avengers = {
  'id': 4,
  'isFav': false,
  'rating': 0,
  'name': 'avengers',
  'displayName': 'Avengers',
  'imdbrating': '9.1',
  'rottenrating': '9.3',
  'match': '95%',
  'releaseYear': '2019',
  'titleFontSize': 25.0,
  'played': false,
  'datePlayed': "",
  'link':
      "https://www.joblo.com/assets/images/joblo/posters/2019/04/avengers_endgame_ver44_xlg_thumb.jpg",
};
var aladdin = {
  'id': 5,
  'isFav': false,
  'rating': 0,
  'name': 'aladdin',
  'displayName': 'Aladdin',
  'imdbrating': '7.9',
  'rottenrating': '7.7',
  'match': '81%',
  'releaseYear': '2019',
  'titleFontSize': 24.0,
  'played': false,
  'datePlayed': "",
  'link':
      "https://www.joblo.com/assets/images/joblo/posters/2019/03/aladdin-poster-2019_thumb.jpg",
};
var creed = {
  'id': 6,
  'isFav': false,
  'rating': 0,
  'name': 'creed',
  'displayName': 'Creed II',
  'imdbrating': '6.1',
  'rottenrating': '5.9',
  'match': '74%',
  'releaseYear': '2015',
  'titleFontSize': 25.0,
  'played': false,
  'datePlayed': "",
  'link':
      "https://www.joblo.com/assets/images/oldsite/posters/images/full/creed21200poster_thumb.jpg",
};
var theKid = {
  'id': 7,
  'isFav': false,
  'rating': 0,
  'name': 'theKid',
  'displayName': 'The Kid Who Became King',
  'imdbrating': '5.9',
  'rottenrating': '5.6',
  'match': '78%',
  'releaseYear': '2019',
  'titleFontSize': 19.0,
  'played': false,
  'datePlayed': "",
  'link':
      "https://www.joblo.com/assets/images/joblo/posters/2018/10/The-Kid-Who-Would-Be-King-poster-1a_thumb.jpg",
};
var searching = {
  'id': 8,
  'isFav': false,
  'rating': 0,
  'name': 'searching',
  'displayName': 'Searching',
  'imdbrating': '7.8',
  'rottenrating': '7.9',
  'match': '69%',
  'releaseYear': '2018',
  'titleFontSize': 24.0,
  'played': false,
  'datePlayed': "",
  'link':
      "https://www.joblo.com/assets/images/oldsite/posters/images/full/Searching-poster-1_thumb.jpg",
};
var ralph = {
  'id': 9,
  'isFav': false,
  'rating': 0,
  'name': 'ralph',
  'displayName': 'Wreck It Ralph',
  'imdbrating': '8.2',
  'rottenrating': '8.6',
  'match': '88%',
  'releaseYear': '2012',
  'titleFontSize': 23.0,
  'played': false,
  'datePlayed': "",
  'link':
      "https://www.joblo.com/assets/images/oldsite/posters/images/full/ralph2-main-poster-xl_thumb.jpg",
};
var bohemianRhapsody = {
  'id': 10,
  'isFav': false,
  'rating': 0,
  'name': 'bohemianRhapsody',
  'displayName': 'Bohemian Rhapsody',
  'imdbrating': '9.1',
  'rottenrating': '9.2',
  'match': '80%',
  'releaseYear': '2018',
  'titleFontSize': 23.0,
  'played': false,
  'datePlayed': "",
  'link':
      "https://www.joblo.com/assets/images/oldsite/posters/images/full/bohemian_rhapsody_poster-xl_thumb.jpg",
};
var incredibles = {
  'id': 11,
  'isFav': false,
  'rating': 0,
  'name': 'incredibles',
  'displayName': 'Incredibles',
  'imdbrating': '8.6',
  'rottenrating': '8.4',
  'match': '93%',
  'releaseYear': '2018',
  'titleFontSize': 25.0,
  'played': false,
  'datePlayed': "",
  'link':
      "https://www.joblo.com/assets/images/oldsite/posters/images/full/incredibles-2-poster_thumb.jpg",
};
var doctorSleep = {
  'id': 12,
  'isFav': false,
  'rating': 0,
  'name': 'doctorSleep',
  'displayName': 'Doctor Sleep',
  'imdbrating': '5.5',
  'rottenrating': '5.7',
  'match': '67%',
  'releaseYear': '2019',
  'titleFontSize': 25.0,
  'played': false,
  'datePlayed': "",
  'link':
      "https://www.joblo.com/assets/images/joblo/posters/2019/10/Doctor-Sleep-poster-2_thumb.jpg",
};
var tenet = {
  'id': 13,
  'isFav': false,
  'rating': 0,
  'name': 'tenet',
  'displayName': 'Tenet',
  'imdbrating': '8.9',
  'rottenrating': '9.0',
  'match': '79%',
  'releaseYear': '2020',
  'titleFontSize': 25.0,
  'played': false,
  'datePlayed': "",
  'link':
      "https://www.joblo.com/assets/images/joblo/posters/2020/07/tenetposterinter_thumb.jpg",
};
var radioactive = {
  'id': 14,
  'isFav': false,
  'rating': 0,
  'name': 'radioactive',
  'displayName': 'Radioactive',
  'imdbrating': '7.0',
  'rottenrating': '7.2',
  'match': '84%',
  'releaseYear': '2019',
  'titleFontSize': 24.0,
  'played': false,
  'datePlayed': "",
  'link':
      "https://www.joblo.com/assets/images/joblo/posters/2020/07/radioactive-poster_thumb.jpg",
};
var blackWidow = {
  'id': 15,
  'isFav': false,
  'rating': 0,
  'name': 'blackWidow',
  'displayName': 'Black Widow',
  'imdbrating': '8.1',
  'rottenrating': '8.4',
  'match': '82%',
  'releaseYear': '2021',
  'titleFontSize': 25.0,
  'played': false,
  'datePlayed': "",
  'link':
      "https://www.joblo.com/assets/images/joblo/posters/2020/03/2EF9FAE7-B888-4DBA-868D-B4E289BAE769_thumb.jpeg",
};
var greyHound = {
  'id': 16,
  'isFav': false,
  'rating': 0,
  'name': 'greyHound',
  'displayName': 'Greyhound',
  'imdbrating': '6.8',
  'rottenrating': '7.2',
  'match': '70%',
  'releaseYear': '2020',
  'titleFontSize': 25.0,
  'played': false,
  'datePlayed': "",
  'link':
      "https://www.joblo.com/assets/images/joblo/posters/2020/03/greyhoundposter_thumb.jpg",
};
var fast9 = {
  'id': 17,
  'isFav': false,
  'rating': 0,
  'name': 'fast 9',
  'displayName': 'Fast And Furious 9',
  'imdbrating': '8.9',
  'rottenrating': '8.6',
  'match': '82%',
  'releaseYear': '2021',
  'titleFontSize': 23.0,
  'played': false,
  'datePlayed': "",
  'link':
      "https://www.joblo.com/assets/images/joblo/posters/2020/01/Fast--Furious-9-Han-poster_thumb.jpg",
};
var earthquake = {
  'id': 18,
  'isFav': false,
  'rating': 0,
  'name': 'earthquake',
  'displayName': 'Earthquake Bird',
  'imdbrating': '8.1',
  'rottenrating': '8.3',
  'match': '71%',
  'releaseYear': '2016',
  'titleFontSize': 23.0,
  'played': false,
  'datePlayed': "",
  'link':
      "https://www.joblo.com/assets/images/joblo/posters/2019/10/earthbirdpostera_thumb.jpg",
};
var maleficent = {
  'id': 19,
  'isFav': false,
  'rating': 0,
  'name': 'maleficent',
  'displayName': 'Maleficent',
  'imdbrating': '8.1',
  'rottenrating': '8.3',
  'match': '80%',
  'releaseYear': '2020',
  'titleFontSize': 23.0,
  'played': false,
  'datePlayed': "",
  'link':
      "https://i.pinimg.com/originals/2f/b8/63/2fb863e6dc16536ba5d59b1038257a00.jpg",
};

var theHell = {
  'id': 20,
  'isFav': false,
  'rating': 0,
  'name': 'the hill',
  'displayName': 'The hill',
  'imdbrating': '8.1',
  'rottenrating': '4.3',
  'match': '80%',
  'releaseYear': '2021',
  'titleFontSize': 23.0,
  'played': false,
  'datePlayed': "",
  'link':
      "https://i.egycdn.com/pic/WmFwZndlY21ZcGptSGNtRW1tRWN2d1BtdnZOZ2FtemE.jpg",
};

var illuminate = {
  'id': 21,
  'isFav': false,
  'rating': 0,
  'name': 'illuminate',
  'displayName': 'Illuminate',
  'imdbrating': '8.1',
  'rottenrating': '5.3',
  'match': '65%',
  'releaseYear': '2021',
  'titleFontSize': 23.0,
  'played': false,
  'datePlayed': "",
  'link':
      "https://i.egycdn.com/pic/WmFwZndlY21ZTGNtRW1qdk5lY212bXZtdm1FbUl4bHg.jpg",
};
List<Map> database = [
  sonic,
  starWars,
  noTimeToDie,
  greyHound,
  onward,
  incredibles,
  radioactive,
  searching,
  doctorSleep,
  creed,
  aladdin,
  ralph,
  avengers,
  theKid,
  tenet,
  blackWidow,
  bohemianRhapsody,
  fast9,
  earthquake,
  maleficent,
  theHell,
  illuminate
];

List<Widget> favs = [];
List<Widget> films = [];
List<Widget> searchedfilms = [];
List<Widget> Rated = [];

class MovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //MAIN POSTER LIKE BUTTON
  void toggleFavorite() {
    setState(() {
      if (earthquake['isFav'] == true) {
        earthquake['isFav'] = false;
      } else {
        earthquake['isFav'] = true;
      }
    });
  }

  //RENDERING FAVORITES FOR FAVORITES PAGE
  void renderFavorites() {
    favs = [];
    for (int i = 0; i < database.length; i++) {
      if (database[i]['isFav'] == true) {
        favs.add(listViewTile(context, database[i]));
      }
    }
  }

  void renderRated() {
    Rated = [];
    for (int i = 0; i < database.length; i++) {
      if (database[i]['rating'] != 0) {
        Rated.add(listViewTile(context, database[i]));
      }
    }
  }

  void renderFilms() {
    films = [];
    for (int i = 0; i < database.length; i++) {
      films.add(listViewTile(context, database[i]));
    }
  }

  //PLAY BUTTON PRESS
  void playButtonPress() {
    setState(() {
      earthquake['played'] = true;
      DateTime now = DateTime.now();
      DateFormat formatter = DateFormat('MM-dd-yyyy');
      earthquake['playedDate'] = formatter.format(now);
    });
  }

  //BOTTOM NAV BAR SELECTION
  int selectedIndex = 0;
  void indexSelected(int index) {
    setState(() {
      selectedIndex = index;
      if (index == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
      if (index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SearchPage()),
        );
      }
      if (index == 2) {
        renderFavorites();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FavoritesPage()),
        );
      }
      if (index == 3) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MorePage()),
        );
      }
    });
  }

  //RANDOMIZING CARROSELL TILES
  List<List<String>> segments = [[], [], [], [], [], []];
  void initSegment(int segmentNum) {
    segments[segmentNum] = [
      starWars['link'],
      sonic['link'],
      noTimeToDie['link'],
      onward['link'],
      avengers['link'],
      aladdin['link'],
      creed['link'],
      theKid['link'],
      searching['link'],
      ralph['link'],
      bohemianRhapsody['link'],
      incredibles['link'],
      doctorSleep['link'],
      tenet['link'],
      radioactive['link'],
      blackWidow['link'],
      greyHound['link'],
      fast9['link'],
    ];
  }

  // ignore: missing_return
  String randSegment(int segmentNum) {
    if (segments[segmentNum].length == 0) {
      initSegment(segmentNum);
    }
    if (segments[segmentNum].length > 1) {
      int r = Random.secure().nextInt(segments[segmentNum].length - 1);
      String cur = segments[segmentNum][r];
      segments[segmentNum].remove(segments[segmentNum][r]);
      return cur;
    } else if (segments[segmentNum].length == 1) {
      String cur = segments[segmentNum][0];
      segments[segmentNum].remove(segments[segmentNum][0]);
      return cur;
    }
  }

  // Avoiding multiple randomizes
  List<List<String>> segmentMovies = [
    [
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " "
    ],
    [
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " "
    ],
    [
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " "
    ],
    [
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " "
    ],
    [
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " "
    ],
    [
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " "
    ],
  ];

  String getSegmentTile(int segmentNum, int tileNum) {
    if (segmentMovies[segmentNum][tileNum] == " ") {
      segmentMovies[segmentNum][tileNum] = randSegment(segmentNum);
    }
    return segmentMovies[segmentNum][tileNum];
  }

  pageSelector(int segmentNum, int tileNum) {
    String link = getSegmentTile(segmentNum, tileNum);

    if (link == sonic['link']) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MoviePage(sonic)));
    }
    if (link == starWars['link']) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => MoviePage(starWars)));
    }
    if (link == onward['link']) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MoviePage(onward)));
    }
    if (link == noTimeToDie['link']) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => MoviePage(noTimeToDie)));
    }
    if (link == avengers['link']) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => MoviePage(avengers)));
    }
    if (link == aladdin['link']) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MoviePage(aladdin)));
    }
    if (link == creed['link']) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MoviePage(creed)));
    }
    if (link == theKid['link']) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MoviePage(theKid)));
    }
    if (link == searching['link']) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => MoviePage(searching)));
    }
    if (link == ralph['link']) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MoviePage(ralph)));
    }
    if (link == bohemianRhapsody['link']) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => MoviePage(bohemianRhapsody)));
    }
    if (link == incredibles['link']) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => MoviePage(incredibles)));
    }
    if (link == doctorSleep['link']) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => MoviePage(doctorSleep)));
    }
    if (link == tenet['link']) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MoviePage(tenet)));
    }
    if (link == radioactive['link']) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => MoviePage(radioactive)));
    }
    if (link == blackWidow['link']) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => MoviePage(blackWidow)));
    }
    if (link == greyHound['link']) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => MoviePage(greyHound)));
    }
    if (link == fast9['link']) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MoviePage(fast9)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 7.5 / 10,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://www.joblo.com/assets/images/joblo/posters/2019/10/earthbirdpostera_thumb.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment(0, 0.50),
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Color.fromRGBO(15, 15, 15, 0.7)
                      ]),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: EdgeInsets.fromLTRB(14, 36, 11, 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Movie of the day",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontFamily: 'Poppins',
                                letterSpacing: 0.0,
                              ),
                            )
                          ],
                        )),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 15),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(width: 60),
                            Container(
                              width: MediaQuery.of(context).size.width / 3.05,
                              height: MediaQuery.of(context).size.height / 18,
                              // ignore: deprecated_member_use
                              child: RaisedButton(
                                onPressed: playButtonPress,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.play_arrow,
                                      size: 35,
                                    ),
                                    Text(
                                      " Play",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 21,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              child: IconButton(
                                icon: (earthquake['isFav']
                                    ? Icon(Icons.favorite,
                                        color: Color.fromRGBO(255, 30, 30, 1),
                                        size: 35)
                                    : Icon(Icons.favorite,
                                        color:
                                            Color.fromRGBO(128, 128, 128, 0.6),
                                        size: 35)),
                                onPressed: () {
                                  if (earthquake['isFav']) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      backgroundColor:
                                          Color.fromRGBO(50, 50, 50, 0.9),
                                      content: Text(
                                        'Removed From Favorites.',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                      duration: const Duration(seconds: 2),
                                      action: SnackBarAction(
                                        label: 'Add Back',
                                        onPressed: toggleFavorite,
                                      ),
                                    ));
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      backgroundColor:
                                          Color.fromRGBO(50, 50, 50, 0.9),
                                      content: const Text(
                                        'Added To Favorites',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                      duration: const Duration(seconds: 2),
                                      action: SnackBarAction(
                                        label: 'Remove',
                                        onPressed: toggleFavorite,
                                      ),
                                    ));
                                  }
                                  toggleFavorite();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 13, 0, 0),
                    child: Text(
                      "Trending Now",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        //SEGMENT 0
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(0, 0)),
                          onTap: () {
                            pageSelector(0, 0);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(0, 1)),
                          onTap: () {
                            pageSelector(0, 1);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(0, 2)),
                          onTap: () {
                            pageSelector(0, 2);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(0, 3)),
                          onTap: () {
                            pageSelector(0, 3);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(0, 4)),
                          onTap: () {
                            pageSelector(0, 4);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(0, 5)),
                          onTap: () {
                            pageSelector(0, 5);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(0, 6)),
                          onTap: () {
                            pageSelector(0, 6);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(0, 7)),
                          onTap: () {
                            pageSelector(0, 7);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(0, 8)),
                          onTap: () {
                            pageSelector(0, 8);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(0, 9)),
                          onTap: () {
                            pageSelector(0, 9);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(0, 10)),
                          onTap: () {
                            pageSelector(0, 10);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(0, 11)),
                          onTap: () {
                            pageSelector(0, 11);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(0, 12)),
                          onTap: () {
                            pageSelector(0, 12);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(0, 13)),
                          onTap: () {
                            pageSelector(0, 13);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(0, 14)),
                          onTap: () {
                            pageSelector(0, 14);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(0, 15)),
                          onTap: () {
                            pageSelector(0, 15);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(0, 16)),
                          onTap: () {
                            pageSelector(0, 16);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(0, 17)),
                          onTap: () {
                            pageSelector(0, 17);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 3, 0, 0),
                    child: Text(
                      "Recommended For You",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        //SEGMENT 5
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(5, 0)),
                          onTap: () {
                            pageSelector(5, 0);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(5, 1)),
                          onTap: () {
                            pageSelector(5, 1);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(5, 2)),
                          onTap: () {
                            pageSelector(5, 2);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(5, 3)),
                          onTap: () {
                            pageSelector(5, 3);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(5, 4)),
                          onTap: () {
                            pageSelector(5, 4);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(5, 5)),
                          onTap: () {
                            pageSelector(5, 5);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(5, 6)),
                          onTap: () {
                            pageSelector(5, 6);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(5, 7)),
                          onTap: () {
                            pageSelector(5, 7);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(5, 8)),
                          onTap: () {
                            pageSelector(5, 8);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(5, 9)),
                          onTap: () {
                            pageSelector(5, 9);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(5, 10)),
                          onTap: () {
                            pageSelector(5, 10);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(5, 11)),
                          onTap: () {
                            pageSelector(5, 11);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(5, 12)),
                          onTap: () {
                            pageSelector(5, 12);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(5, 13)),
                          onTap: () {
                            pageSelector(5, 13);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(5, 14)),
                          onTap: () {
                            pageSelector(5, 14);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(5, 15)),
                          onTap: () {
                            pageSelector(5, 15);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(5, 16)),
                          onTap: () {
                            pageSelector(5, 16);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(5, 17)),
                          onTap: () {
                            pageSelector(5, 17);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 3, 0, 0),
                    child: Text(
                      "New Releases",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        //SEGMENT 1
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(1, 0)),
                          onTap: () {
                            pageSelector(1, 0);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(1, 1)),
                          onTap: () {
                            pageSelector(1, 1);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(1, 2)),
                          onTap: () {
                            pageSelector(1, 2);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(1, 3)),
                          onTap: () {
                            pageSelector(1, 3);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(1, 4)),
                          onTap: () {
                            pageSelector(1, 4);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(1, 5)),
                          onTap: () {
                            pageSelector(1, 5);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(1, 6)),
                          onTap: () {
                            pageSelector(1, 6);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(1, 7)),
                          onTap: () {
                            pageSelector(1, 7);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(1, 8)),
                          onTap: () {
                            pageSelector(1, 8);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(1, 9)),
                          onTap: () {
                            pageSelector(1, 9);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(1, 10)),
                          onTap: () {
                            pageSelector(1, 10);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(1, 11)),
                          onTap: () {
                            pageSelector(1, 11);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(1, 12)),
                          onTap: () {
                            pageSelector(1, 12);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(1, 13)),
                          onTap: () {
                            pageSelector(1, 13);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(1, 14)),
                          onTap: () {
                            pageSelector(1, 14);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(1, 15)),
                          onTap: () {
                            pageSelector(1, 15);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(1, 16)),
                          onTap: () {
                            pageSelector(1, 16);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(1, 17)),
                          onTap: () {
                            pageSelector(1, 17);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 3, 0, 0),
                    child: Text(
                      "Award Winners",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        //SEGMENT 2
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(2, 0)),
                          onTap: () {
                            pageSelector(2, 0);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(2, 1)),
                          onTap: () {
                            pageSelector(2, 1);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(2, 2)),
                          onTap: () {
                            pageSelector(2, 2);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(2, 3)),
                          onTap: () {
                            pageSelector(2, 3);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(2, 4)),
                          onTap: () {
                            pageSelector(2, 4);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(2, 5)),
                          onTap: () {
                            pageSelector(2, 5);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(2, 6)),
                          onTap: () {
                            pageSelector(2, 6);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(2, 7)),
                          onTap: () {
                            pageSelector(2, 7);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(2, 8)),
                          onTap: () {
                            pageSelector(2, 8);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(2, 9)),
                          onTap: () {
                            pageSelector(2, 9);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(2, 10)),
                          onTap: () {
                            pageSelector(2, 10);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(2, 11)),
                          onTap: () {
                            pageSelector(2, 11);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(2, 12)),
                          onTap: () {
                            pageSelector(2, 12);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(2, 13)),
                          onTap: () {
                            pageSelector(2, 13);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(2, 14)),
                          onTap: () {
                            pageSelector(2, 14);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(2, 15)),
                          onTap: () {
                            pageSelector(2, 15);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(2, 16)),
                          onTap: () {
                            pageSelector(2, 16);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(2, 17)),
                          onTap: () {
                            pageSelector(2, 17);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 3, 0, 0),
                    child: Text(
                      "Popular on Netflix",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        //SEGMENT 3
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(3, 0)),
                          onTap: () {
                            pageSelector(3, 0);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(3, 1)),
                          onTap: () {
                            pageSelector(3, 1);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(3, 2)),
                          onTap: () {
                            pageSelector(3, 2);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(3, 3)),
                          onTap: () {
                            pageSelector(3, 3);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(3, 4)),
                          onTap: () {
                            pageSelector(3, 4);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(3, 5)),
                          onTap: () {
                            pageSelector(3, 5);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(3, 6)),
                          onTap: () {
                            pageSelector(3, 6);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(3, 7)),
                          onTap: () {
                            pageSelector(3, 7);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(3, 8)),
                          onTap: () {
                            pageSelector(3, 8);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(3, 9)),
                          onTap: () {
                            pageSelector(3, 9);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(3, 10)),
                          onTap: () {
                            pageSelector(3, 10);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(3, 11)),
                          onTap: () {
                            pageSelector(3, 11);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(3, 12)),
                          onTap: () {
                            pageSelector(3, 12);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(3, 13)),
                          onTap: () {
                            pageSelector(3, 13);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(3, 14)),
                          onTap: () {
                            pageSelector(3, 14);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(3, 15)),
                          onTap: () {
                            pageSelector(3, 15);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(3, 16)),
                          onTap: () {
                            pageSelector(3, 16);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(3, 17)),
                          onTap: () {
                            pageSelector(3, 17);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 3, 0, 0),
                    child: Text(
                      "Editors' Choice",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        //SEGMENT 4
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(4, 0)),
                          onTap: () {
                            pageSelector(4, 0);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(4, 1)),
                          onTap: () {
                            pageSelector(4, 1);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(4, 2)),
                          onTap: () {
                            pageSelector(4, 2);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(4, 3)),
                          onTap: () {
                            pageSelector(4, 3);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(4, 4)),
                          onTap: () {
                            pageSelector(4, 4);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(4, 5)),
                          onTap: () {
                            pageSelector(4, 5);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(4, 6)),
                          onTap: () {
                            pageSelector(4, 6);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(4, 7)),
                          onTap: () {
                            pageSelector(4, 7);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(4, 8)),
                          onTap: () {
                            pageSelector(4, 8);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(4, 9)),
                          onTap: () {
                            pageSelector(4, 9);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(4, 10)),
                          onTap: () {
                            pageSelector(4, 10);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(4, 11)),
                          onTap: () {
                            pageSelector(4, 11);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(4, 12)),
                          onTap: () {
                            pageSelector(4, 12);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(4, 13)),
                          onTap: () {
                            pageSelector(4, 13);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(4, 14)),
                          onTap: () {
                            pageSelector(4, 14);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(4, 15)),
                          onTap: () {
                            pageSelector(4, 15);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(4, 16)),
                          onTap: () {
                            pageSelector(4, 16);
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, getSegmentTile(4, 17)),
                          onTap: () {
                            pageSelector(4, 17);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.amp_stories),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.live_tv_outlined),
            label: 'Rated',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.table_rows),
            label: 'More',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: indexSelected,
      ),
    );
  }
}

//NEXT: ADD MORE CARROSELLS
//EDITED: 6/2 --- 13:00 --- ~z
