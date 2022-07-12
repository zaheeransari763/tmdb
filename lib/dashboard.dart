import 'package:flutter/material.dart';

import 'constants.dart';

class Dashboard extends StatefulWidget{
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(children: [

        ],),
        actions: [ Constants.SearchtextField("Search", Icon(Icons.email),

        ),],
      ),

    );
  }
}