import 'package:flutter/material.dart';
import 'package:victory_villa/model/enum.dart' as enums;
import 'package:victory_villa/utils/colors.dart';

AppBar customAppBar({required String title}) {
  return AppBar(
    backgroundColor: VictoryColor.primaryColor,
    title: Text(title),
    centerTitle: true,
    actions: <Widget>[
      PopupMenuButton<enums.Menu>(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        onSelected: (enums.Menu item) {},
        itemBuilder: (BuildContext context) => <PopupMenuEntry<enums.Menu>>[
          PopupMenuItem<enums.Menu>(
            value: enums.Menu.itemOne,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Contact',
              style: TextStyle(color: VictoryColor.primaryColor),
            ),
          ),
        ],
      ),
    ],
  );
}
