import 'package:flutter/material.dart';
import 'SearchPage.dart';
import 'main.dart';
import 'MorePage.dart';
import 'ListViewTile.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
//RENDERING FAVORITES FOR FAVORITES PAGE
  void renderFavorites() {
    favs = [];
    for (int i = 0; i < database.length; i++) {
      if (database[i]['isFav'] == true) {
        favs.add(listViewTile(context, database[i]));
      }
    }
  }

  //BOTTOM NAV BAR SELECTION
  int selectedIndex = 2;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(100, 100, 100, 0.03),
        centerTitle: true,
        title: Text(
          "Favorites",
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'Poppins',
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      body: favs.length == 0
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
                  children: favs,
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
