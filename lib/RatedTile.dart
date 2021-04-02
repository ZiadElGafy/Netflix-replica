import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'MoviePage.dart';

Card ratedTile(BuildContext context, Map mp) {
  return Card(
    color: Colors.transparent,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.transparent,
              Colors.transparent,
              Color.fromRGBO(195, 195, 195, 0.3),
              Color.fromRGBO(80, 80, 80, 0.01),
            ]),
      ),
      width: MediaQuery.of(context).size.width * 9.5 / 10,
      child: Row(
        children: [
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Container(
              height: MediaQuery.of(context).size.height * 2 / 10,
              color: Colors.transparent,
              child: Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 1.95 / 10,
                    width: MediaQuery.of(context).size.width * 2.3 / 10,
                    margin: EdgeInsets.fromLTRB(2, 0, 10, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(mp['link']),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 2 / 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 7),
                        FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            mp['displayName'],
                            style: TextStyle(
                              fontSize: mp['titleFontSize'] - 1,
                              color: Colors.white,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                        SizedBox(height: 1.5),
                        FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            mp['match'] + " Match",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 20,
                              color: Color.fromRGBO(50, 255, 50, 0.9),
                              letterSpacing: 0.8,
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            mp['played'] == true
                                ? "Watched on " + mp['playedDate']
                                : "You haven't watched this movie yet",
                            style: TextStyle(
                              color: Color.fromRGBO(150, 150, 150, 0.65),
                              fontSize: 13,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MoviePage(mp)));
            },
          ),
        ],
      ),
    ),
  );
}
