import 'package:flutter/material.dart';
// ignore: unused_import
import 'MoviePage.dart';
import 'SearchPage.dart';
import 'FavoritesPage.dart';
import 'main.dart';
import 'RatedPage.dart';
import 'RatedTile.dart';
import 'ListViewTile.dart';

class MorePage extends StatefulWidget {
  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
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
      films.add(listViewTile(context, database[i]));
    }
  }

  //BOTTOM NAV BAR SELECTION
  int selectedIndex = 4;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Text(
          "More",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(
                Icons.account_circle,
                size: 30,
              ),
              onPressed: () {}),
        ],
      ),
      backgroundColor: Colors.transparent,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: InkWell(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(20, 20, 20, 0.9),
                      border: Border(
                        bottom: BorderSide(
                            width: 2, color: Color.fromRGBO(10, 10, 10, 1)),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 27),
                        child: Text(
                          "My Account",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 23,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {},
              ),
            ),
            Flexible(
              flex: 1,
              child: InkWell(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(20, 20, 20, 0.9),
                      border: Border(
                        top: BorderSide(
                            width: 2, color: Color.fromRGBO(10, 10, 10, 1)),
                        bottom: BorderSide(
                            width: 2, color: Color.fromRGBO(10, 10, 10, 1)),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 27),
                        child: Text(
                          "Edit Profile",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 23,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {},
              ),
            ),
            Flexible(
              flex: 1,
              child: InkWell(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(20, 20, 20, 0.9),
                      border: Border(
                        top: BorderSide(
                            width: 2, color: Color.fromRGBO(10, 10, 10, 1)),
                        bottom: BorderSide(
                            width: 2, color: Color.fromRGBO(10, 10, 10, 1)),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 27),
                        child: Text(
                          "Settings",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 23,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {},
              ),
            ),
            Flexible(
              flex: 1,
              child: InkWell(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(20, 20, 20, 0.9),
                      border: Border(
                        top: BorderSide(
                            width: 2, color: Color.fromRGBO(10, 10, 10, 1)),
                        bottom: BorderSide(
                            width: 2, color: Color.fromRGBO(10, 10, 10, 1)),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 27),
                        child: Text(
                          "Subscribtions",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 23,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {},
              ),
            ),
            Flexible(
              flex: 1,
              child: InkWell(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(20, 20, 20, 0.9),
                      border: Border(
                        top: BorderSide(
                            width: 2, color: Color.fromRGBO(10, 10, 10, 1)),
                        bottom: BorderSide(
                            width: 2, color: Color.fromRGBO(10, 10, 10, 1)),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 27),
                        child: Text(
                          "About",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 23,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {},
              ),
            ),
            Flexible(
              flex: 1,
              child: InkWell(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(20, 20, 20, 0.9),
                      border: Border(
                        top: BorderSide(
                            width: 2, color: Color.fromRGBO(10, 10, 10, 1)),
                        bottom: BorderSide(
                            width: 2, color: Color.fromRGBO(10, 10, 10, 1)),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 27),
                        child: Text(
                          "Switch User",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 23,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {},
              ),
            ),
            Flexible(
              flex: 1,
              child: InkWell(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(20, 20, 20, 0.9),
                      border: Border(
                        top: BorderSide(
                            width: 2, color: Color.fromRGBO(10, 10, 10, 1)),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 27),
                        child: Text(
                          "Logout",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 23,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {},
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
