import 'package:flutter/material.dart';

Container carrosellTile(BuildContext context, String adress) {
  return Container(
      height: MediaQuery.of(context).size.height / 4.25,
      width: MediaQuery.of(context).size.width / 3.5,
      margin: EdgeInsets.fromLTRB(5, 6, 5, 13),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
          image: NetworkImage(adress),
          fit: BoxFit.fill,
        ),
      ));
}
