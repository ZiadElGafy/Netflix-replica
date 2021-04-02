import 'package:flutter/material.dart';
// ignore: unused_import
import 'MoviePage.dart';
import 'main.dart';
import 'FavoritesPage.dart';
import 'MorePage.dart';
import 'ListViewTile.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool search = false;
  bool found = false;
  bool changed = false;
  final TextEditingController myController = TextEditingController();
  String searchtxt;
  String s1;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
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

  void renderFilms() {
    setState(() {
      films = [];
      searchedfilms = [];
      for (int i = 0; i < database.length; i++) {
        films.add(listViewTile(context, database[i]));
      }
      found = false;
      changed = false;
    });
  }

  // ignore: non_constant_identifier_names
  void searchfilms(String f_name) {
    searchedfilms = [];

    for (int j = 0; j < f_name.length; j++) {
      if (f_name[j] == ' ' && j < f_name.length - 1) {
        f_name[j + 1].toUpperCase();
      }
    }
    setState(() {
      for (int i = 0; i < database.length; i++) {
        s1 = f_name[0].toUpperCase();
        if (database[i]['displayName'] == (s1 + f_name.substring(1))) {
          searchedfilms.removeRange(0, searchedfilms.length);
          searchedfilms.add(listViewTile(context, database[i]));
          found = true;
          changed = true;
          break;
        } else if (database[i]['displayName']
            .toString()
            .contains((s1 + f_name.substring(1)))) {
          if (!searchedfilms.contains(database[i]['displayName'])) {
            searchedfilms.add(listViewTile(context, database[i]));
            print(searchedfilms);
          } else {
            found = false;
            changed = true;
            continue;
          }
          found = true;
          changed = true;
        } else {
          found = false;
        }
      }
    });
  }

  //BOTTOM NAV BAR SELECTION
  int selectedIndex = 1;
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
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3 / 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 8.5 / 10,
            height: MediaQuery.of(context).size.height * 0.6 / 10,
            child: TextField(
              onChanged: (myController) {
                searchtxt = myController;
                if (searchtxt.length != 0) {
                  searchfilms(searchtxt);
                } else {
                  renderFilms();
                }

                print(searchtxt);
                print(changed & found);
              },
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontSize: 25,
                  letterSpacing: 0.0),
              autocorrect: true,
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
          searchedfilms.length == 0 && (found == false) && (changed == true)
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
                        child: Image.asset('assets/noRated.png'),
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
                  height: MediaQuery.of(context).size.height * 8.4 / 10,
                  color: Colors.transparent,
                  child: SingleChildScrollView(
                    child: Column(
                        children: (searchedfilms.length == 0) &&
                                (changed == false) &&
                                (found == false)
                            ? films
                            : searchedfilms),
                  ),
                ),
        ],
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
