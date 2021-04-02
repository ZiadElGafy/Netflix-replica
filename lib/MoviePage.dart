import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'carrosellTile.dart';
import 'main.dart';
import 'SearchPage.dart';
import 'FavoritesPage.dart';
import 'MorePage.dart';
import 'ListViewTile.dart';
import 'RatedPage.dart';
import 'RatedTile.dart';
import 'package:intl/intl.dart';

class MoviePage extends StatefulWidget {
  final Map mp;
  MoviePage(this.mp);

  final mainColor = Colors.transparent;
  final appBarColor = Color.fromRGBO(100, 100, 100, 0.03);

  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
//RENDERING FAVORITES FOR FAVORITES PAGE
  void renderFavorites() {
    favs = [];
    for (int i = 0; i < database.length; i++) {
      if (database[i]['isFav'] == true) {
        favs.add(listViewTile(context, database[i]));
      }
    }
  }

  //RENDERING RATED FOR RATED PAGE
  void renderRated() {
    rated = [];
    for (int i = 0; i < database.length; i++) {
      if (database[i]['rating'] != 0) {
        rated.add(ratedTile(context, database[i]));
      }
    }
  }

  void renderFilms() {
    films = [];
    for (int i = 0; i < database.length; i++) {
      films.add(ratedTile(context, database[i]));
    }
  }

  //PLAY BUTTON TAPPED
  void playedMovie() {
    setState(() {
      openurl(widget.mp['flimlink']);
      widget.mp['played'] = true;
      DateTime now = DateTime.now();
      DateFormat formatter = DateFormat('MM-dd-yyyy');
      widget.mp['playedDate'] = formatter.format(now);
    });
  }

  openurl(String s) {
    String film = s;
    launch(film);
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
        renderFilms();
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
        renderRated();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RatedPage()),
        );
      }
      if (index == 4) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MorePage()),
        );
      }
    });
  }

  //POSTER LIKE BUTTON
  bool isFavorited = false;
  void toggleFavorite() {
    setState(() {
      if (isFavorited == true) {
        isFavorited = false;
      } else {
        isFavorited = true;
      }
      if (widget.mp['isFav'] == true) {
        widget.mp['isFav'] = false;
      } else {
        widget.mp['isFav'] = true;
      }
    });
  }

  //SETTING RATING

  var stars = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 1.0 / 13.8,
        backgroundColor: widget.appBarColor,
        centerTitle: true,
        title: Text(
          widget.mp['displayName'],
          style: TextStyle(
            color: Colors.white,
            fontSize: widget.mp['titleFontSize'],
            fontFamily: 'Poppins',
            letterSpacing: 0.0,
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
              color: widget.mainColor,
              child: Column(
                children: [
                  Center(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 17, 0, 17),
                      width: MediaQuery.of(context).size.width * 5 / 10,
                      height: MediaQuery.of(context).size.height * 4 / 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: NetworkImage(widget.mp['link']),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(14, 36, 11, 20),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 9, 14),
                              child: Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(width: 60),
                                    Container(
                                      child: IconButton(
                                        icon: (widget.mp['isFav']
                                            ? Icon(Icons.favorite,
                                                color: Color.fromRGBO(
                                                    255, 30, 30, 1),
                                                size: 43)
                                            : Icon(Icons.favorite,
                                                color: Color.fromRGBO(
                                                    128, 128, 128, 0.6),
                                                size: 43)),
                                        onPressed: () {
                                          if (widget.mp['isFav']) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              backgroundColor: Color.fromRGBO(
                                                  50, 50, 50, 0.9),
                                              content: Text(
                                                'Removed From Favorites.',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: 'Poppins',
                                                ),
                                              ),
                                              duration:
                                                  const Duration(seconds: 2),
                                              action: SnackBarAction(
                                                label: 'Add Back',
                                                onPressed: toggleFavorite,
                                              ),
                                            ));
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              backgroundColor: Color.fromRGBO(
                                                  50, 50, 50, 0.9),
                                              content: const Text(
                                                'Added To Favorites',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: 'Poppins',
                                                ),
                                              ),
                                              duration:
                                                  const Duration(seconds: 2),
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
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2.1,
                        height: MediaQuery.of(context).size.height / 14,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          onPressed: playedMovie,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Icon(
                                  Icons.play_arrow,
                                  size: 42,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 6),
                                child: Text(
                                  " Play",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 26,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2.1,
                        height: MediaQuery.of(context).size.height / 14,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          color: Color.fromRGBO(110, 200, 40, 1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.download_sharp,
                                size: 33,
                              ),
                              Text(
                                "Download",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  )
                ],
              )),
          Column(
            children: [
              Row(
                children: [
                  Container(
                    color: widget.mainColor,
                    width: MediaQuery.of(context).size.width * 5 / 10,
                    height: MediaQuery.of(context).size.height / 4.0,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Row(
                                children: [
                                  Text(
                                    widget.mp['match'],
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 20,
                                      color: Color.fromRGBO(50, 255, 50, 0.9),
                                      letterSpacing: 1,
                                    ),
                                  ),
                                  Text(
                                    " match",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 20,
                                      color: Color.fromRGBO(50, 255, 50, 0.9),
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(7, 0, 7, 0),
                              child: Image.asset('assets/IMDBicon.png'),
                              width: MediaQuery.of(context).size.width / 8,
                              height: MediaQuery.of(context).size.height / 14,
                            ),
                            Text(
                              "Rating : ",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              widget.mp['imdbrating'],
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color.fromRGBO(50, 255, 50, 0.9),
                                fontSize: 17,
                                letterSpacing: 1.4,
                              ),
                            ),
                            Text(
                              "/10",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color.fromRGBO(50, 255, 50, 0.9),
                                fontSize: 17,
                                letterSpacing: 1.4,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(7, 0, 7, 0),
                              child: Image.asset('assets/rottenicon.png'),
                              width: MediaQuery.of(context).size.width / 8,
                              height: MediaQuery.of(context).size.height / 14,
                            ),
                            Text(
                              "Rating : ",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              widget.mp['rottenrating'],
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color.fromRGBO(50, 255, 50, 0.9),
                                fontSize: 17,
                                letterSpacing: 1.4,
                              ),
                            ),
                            Text(
                              "/10",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color.fromRGBO(50, 255, 50, 0.9),
                                fontSize: 17,
                                letterSpacing: 1.4,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(7, 2, 7, 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Release Year:",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 13,
                                  color: Color.fromRGBO(160, 160, 160, 0.6),
                                ),
                              ),
                              Text(
                                widget.mp['releaseYear'],
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 13.0,
                                  color: Color.fromRGBO(160, 160, 160, 0.6),
                                  letterSpacing: 0.9,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: widget.mainColor,
                    width: MediaQuery.of(context).size.width * 5 / 10,
                    height: MediaQuery.of(context).size.height / 4.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FittedBox(
                          fit: BoxFit.fill,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                                child: RotationTransition(
                                  turns: AlwaysStoppedAnimation(247 / 360),
                                  child: IconButton(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    icon: ((widget.mp['rating'] == 0)
                                        ? Icon(
                                            Icons.grade_outlined,
                                            color:
                                                Color.fromRGBO(140, 255, 0, 1),
                                            size: 32,
                                          )
                                        : Icon(
                                            Icons.grade,
                                            color:
                                                Color.fromRGBO(140, 255, 0, 1),
                                            size: 33,
                                          )),
                                    onPressed: () {
                                      if (stars[0] != true ||
                                          stars[1] != false ||
                                          stars[2] != false ||
                                          stars[3] != false ||
                                          stars[4] != false) {
                                        setState(() {
                                          stars[0] = true;
                                          stars[1] = false;
                                          stars[2] = false;
                                          stars[3] = false;
                                          stars[4] = false;
                                        });
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          backgroundColor:
                                              Color.fromRGBO(50, 50, 50, 0.9),
                                          content: const Text(
                                            'You Rated the movie 1 star.',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                          duration: const Duration(seconds: 2),
                                        ));
                                      }
                                      setState(() {
                                        widget.mp['rating'] = 1;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: RotationTransition(
                                  turns: AlwaysStoppedAnimation(330 / 360),
                                  child: IconButton(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    icon: ((widget.mp['rating'] == 0 ||
                                            widget.mp['rating'] == 1)
                                        ? Icon(
                                            Icons.grade_outlined,
                                            color:
                                                Color.fromRGBO(140, 255, 0, 1),
                                            size: 32,
                                          )
                                        : Icon(
                                            Icons.grade,
                                            color:
                                                Color.fromRGBO(140, 255, 0, 1),
                                            size: 33,
                                          )),
                                    onPressed: () {
                                      if (stars[0] != true ||
                                          stars[1] != true ||
                                          stars[2] != false ||
                                          stars[3] != false ||
                                          stars[4] != false) {
                                        setState(() {
                                          stars[0] = true;
                                          stars[1] = true;
                                          stars[2] = false;
                                          stars[3] = false;
                                          stars[4] = false;
                                        });
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          backgroundColor:
                                              Color.fromRGBO(50, 50, 50, 0.9),
                                          content: const Text(
                                            'You Rated the movie 2 stars.',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                          duration: const Duration(seconds: 2),
                                        ));
                                      }
                                      setState(() {
                                        widget.mp['rating'] = 2;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                                child: RotationTransition(
                                  turns: AlwaysStoppedAnimation(360 / 360),
                                  child: IconButton(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    icon: ((widget.mp['rating'] == 0 ||
                                            widget.mp['rating'] == 1 ||
                                            widget.mp['rating'] == 2)
                                        ? Icon(
                                            Icons.grade_outlined,
                                            color:
                                                Color.fromRGBO(140, 255, 0, 1),
                                            size: 32,
                                          )
                                        : Icon(
                                            Icons.grade,
                                            color:
                                                Color.fromRGBO(140, 255, 0, 1),
                                            size: 33,
                                          )),
                                    onPressed: () {
                                      if (stars[0] != true ||
                                          stars[1] != true ||
                                          stars[2] != true ||
                                          stars[3] != false ||
                                          stars[4] != false) {
                                        setState(() {
                                          stars[0] = true;
                                          stars[1] = true;
                                          stars[2] = true;
                                          stars[3] = false;
                                          stars[4] = false;
                                        });
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          backgroundColor:
                                              Color.fromRGBO(50, 50, 50, 0.9),
                                          content: const Text(
                                            'You Rated the movie 3 stars.',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                          duration: const Duration(seconds: 2),
                                        ));
                                      }
                                      setState(() {
                                        widget.mp['rating'] = 3;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: RotationTransition(
                                  turns: AlwaysStoppedAnimation(30 / 360),
                                  child: IconButton(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    icon: ((widget.mp['rating'] == 0 ||
                                            widget.mp['rating'] == 1 ||
                                            widget.mp['rating'] == 2 ||
                                            widget.mp['rating'] == 3)
                                        ? Icon(
                                            Icons.grade_outlined,
                                            color:
                                                Color.fromRGBO(140, 255, 0, 1),
                                            size: 32,
                                          )
                                        : Icon(
                                            Icons.grade,
                                            color:
                                                Color.fromRGBO(140, 255, 0, 1),
                                            size: 33,
                                          )),
                                    onPressed: () {
                                      if (stars[0] != true ||
                                          stars[1] != true ||
                                          stars[2] != true ||
                                          stars[3] != true ||
                                          stars[4] != false) {
                                        setState(() {
                                          stars[0] = true;
                                          stars[1] = true;
                                          stars[2] = true;
                                          stars[3] = true;
                                          stars[4] = false;
                                        });
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          backgroundColor:
                                              Color.fromRGBO(50, 50, 50, 0.9),
                                          content: const Text(
                                            'You Rated the movie 4 stars.',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                          duration: const Duration(seconds: 2),
                                        ));
                                      }
                                      setState(() {
                                        widget.mp['rating'] = 4;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 65, 0, 0),
                                child: RotationTransition(
                                  turns: AlwaysStoppedAnimation(113 / 360),
                                  child: IconButton(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    icon: ((widget.mp['rating'] == 0 ||
                                            widget.mp['rating'] == 1 ||
                                            widget.mp['rating'] == 2 ||
                                            widget.mp['rating'] == 3 ||
                                            widget.mp['rating'] == 4)
                                        ? Icon(
                                            Icons.grade_outlined,
                                            color:
                                                Color.fromRGBO(140, 255, 0, 1),
                                            size: 32,
                                          )
                                        : Icon(
                                            Icons.grade,
                                            color:
                                                Color.fromRGBO(140, 255, 0, 1),
                                            size: 33,
                                          )),
                                    onPressed: () {
                                      if (stars[0] != true ||
                                          stars[1] != true ||
                                          stars[2] != true ||
                                          stars[3] != true ||
                                          stars[4] != true) {
                                        setState(() {
                                          stars[0] = true;
                                          stars[1] = true;
                                          stars[2] = true;
                                          stars[3] = true;
                                          stars[4] = true;
                                        });
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          backgroundColor:
                                              Color.fromRGBO(50, 50, 50, 0.9),
                                          content: const Text(
                                            'You Rated the movie 5 stars.',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                          duration: const Duration(seconds: 2),
                                        ));
                                      }
                                      setState(() {
                                        widget.mp['rating'] = 5;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "Rate The",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            letterSpacing: 0,
                            color: Color.fromRGBO(255, 255, 255, 0.9),
                          ),
                        ),
                        Text(
                          "Movie",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            letterSpacing: 0,
                            color: Color.fromRGBO(255, 255, 255, 0.9),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 2 / 1.8,
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(5, 3, 0, 0),
                      child: Text(
                        "Similar movies",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          child: carrosellTile(context, starWars['link']),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MoviePage(starWars)),
                            );
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, onward['link']),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MoviePage(onward)),
                            );
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, theKid['link']),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MoviePage(theKid)),
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          child: carrosellTile(context, avengers['link']),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MoviePage(avengers)),
                            );
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, ralph['link']),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MoviePage(ralph)),
                            );
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, incredibles['link']),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MoviePage(incredibles)),
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          child: carrosellTile(context, blackWidow['link']),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MoviePage(blackWidow)),
                            );
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, fast9['link']),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MoviePage(fast9)),
                            );
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, radioactive['link']),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MoviePage(radioactive)),
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          child: carrosellTile(context, aladdin['link']),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MoviePage(aladdin)),
                            );
                          },
                        ),
                        InkWell(
                          child: carrosellTile(context, searching['link']),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MoviePage(searching)),
                            );
                          },
                        ),
                        InkWell(
                          child:
                              carrosellTile(context, bohemianRhapsody['link']),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MoviePage(bohemianRhapsody)),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ]),
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
            icon: Icon(Icons.grade),
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
