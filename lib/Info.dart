import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  String name;
  String phone;

  Info({this.name, this.phone});

  @override
  State<StatefulWidget> createState() {
    return _Info();
  }
}

class _Info extends State<Info> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final title = 'Contact Info';

    return MaterialApp(
        title: title,
        home: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text(title),
            leading: Builder(
              builder: (BuildContext _context) {
                return IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  tooltip:
                      MaterialLocalizations.of(_context).openAppDrawerTooltip,
                );
              },
            ),
          ),
          body: Container(
            margin: const EdgeInsets.all(10),
            width: width - 20,
            height: height - 20,
            child: Column(
              children: [
                Image.network('https://picsum.photos/250?image=9',
                    height: 100, width: 100),
              ],
            ),
          ),
        ));
  }
}
