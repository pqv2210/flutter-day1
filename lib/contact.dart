import 'package:flutter/material.dart';
import 'detail-contact.dart';

class Contact extends StatefulWidget {
  String name;
  String phone;

  Contact({this.name, this.phone});

  @override
  State<StatefulWidget> createState() {
    return _Contact();
  }
}

class _Contact extends State<Contact> {
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
    print('listContact $listContact');
    return MaterialApp(
        title: 'Contact Page',
        home: Scaffold(
            key: _scaffoldKey,
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
                    FlatButton(
                      child: Text('Add Transection'),
                      color: Colors.pink[200],
                      textColor: Colors.blueGrey[700],
                      onPressed: () {
                        listContact.add(DetailContact(
                            name: contact.name, phone: contact.phone));
                        _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text(contact.toString()),
                          duration: Duration(seconds: 3),
                        ));
                        setState(() {
                          nameEdittingController.text = '';
                          phoneEdittingController.text = '';
                        });
                      },
                    ),
                  ],
                ),
              ),
            )));
  }
}
