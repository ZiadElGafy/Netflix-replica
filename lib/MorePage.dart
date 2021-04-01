import 'package:flutter/material.dart';
import 'MoviePage.dart';
import 'SearchPage.dart';
import 'FavoritesPage.dart';
import 'main.dart';
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
            fontWeight: FontWeight.bold,
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
            InkWell(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1.11 / 10,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(20, 20, 20, 0.9),
                    border: Border.all()),
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
