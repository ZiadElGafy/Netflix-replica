import 'package:flutter/material.dart';
import 'SearchPage.dart';
import 'main.dart';
import 'MorePage.dart';
import 'ListViewTile.dart';
import 'FavoritesPage.dart';
import 'RatedTile.dart';

class RatedPage extends StatefulWidget {
  @override
  _RatedPageState createState() => _RatedPageState();
}

class _RatedPageState extends State<RatedPage> {
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
  int selectedIndex = 3;
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
        backgroundColor: Color.fromRGBO(100, 100, 100, 0.03),
        centerTitle: true,
        title: Text(
          "Rated",
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'Poppins',
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      body: rated.length == 0
          ? Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 2.4 / 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.6,
                    child: Image.asset('assets/noFavorites.png'),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.17 / 10,
                  ),
                  Text(
                    "No Movies Found",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 21,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          : Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent,
              child: SingleChildScrollView(
                child: Column(
                  children: rated,
                ),
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
