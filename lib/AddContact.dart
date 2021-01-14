import 'package:flutter/material.dart';
import 'detail-contact.dart';

class AddContact extends StatefulWidget {
  String name;
  String phone;

  AddContact({this.name, this.phone});

  @override
  State<StatefulWidget> createState() {
    return _AddContact();
  }
}

class _AddContact extends State<AddContact> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final nameEdittingController = TextEditingController();
  final phoneEdittingController = TextEditingController();

  DetailContact contact = DetailContact(name: '', phone: '');
  List<DetailContact> listContact = List<DetailContact>();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    nameEdittingController.dispose();
    phoneEdittingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final title = 'Add Contact';

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
                      Navigator.pop(
                          context,
                          DetailContact(
                              name: contact.name, phone: contact.phone));
                    },
                    tooltip:
                        MaterialLocalizations.of(_context).openAppDrawerTooltip,
                  );
                },
              ),
            ),
            body: SafeArea(
              minimum: EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: TextField(
                        controller: nameEdittingController,
                        onChanged: (name) {
                          this.setState(() {
                            contact.name = name;
                          });
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                  const Radius.circular(5))),
                          labelText: 'Enter name',
                        ),
                      ),
                    ),
                    TextField(
                      controller: phoneEdittingController,
                      onChanged: (phone) {
                        this.setState(() {
                          contact.phone = phone;
                        });
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(5))),
                        labelText: 'Enter phone',
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: new FlatButton(
                        child: Text('Add Contact'),
                        color: Colors.pink[200],
                        textColor: Colors.white,
                        onPressed: () {
                          if (contact.name != '' && contact.phone != '') {
                            setState(() {
                              nameEdittingController.clear();
                              phoneEdittingController.clear();
                            });
                            Navigator.pop(
                                context,
                                DetailContact(
                                    name: contact.name, phone: contact.phone));
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
