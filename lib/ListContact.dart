import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'AddContact.dart';
import 'Info.dart';
import 'detail-contact.dart';

class ListContact extends StatefulWidget {
  List<DetailContact> listContact;

  ListContact({Key key, @required this.listContact}) : super(key: key);

  State<StatefulWidget> createState() {
    return _ListContact();
  }
}

class _ListContact extends State<ListContact> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final title = 'List Contact';

    return MaterialApp(
        title: title,
        home: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: RefreshIndicator(
            onRefresh: _pullRefresh,
            child: ListView.builder(
              itemCount: this.widget.listContact.length,
              itemBuilder: (context, index) {
                final name = this.widget.listContact[index].name;
                return ListTile(
                    title: Text('$name'),
                    leading: GestureDetector(
                      child: Container(
                        width: 50,
                        height: 50,
                        padding: EdgeInsets.symmetric(vertical: 5),
                        alignment: Alignment.center,
                        child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://placeimg.com/640/480/any/$name')),
                      ),
                    ),
                    onLongPress: () {
                      _showAlert(context, index);
                    },
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Info(name: name)),
                      );
                    });
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _goToAddContact(context);
            },
            child: Icon(Icons.plus_one),
            backgroundColor: Colors.green,
          ),
        ));
  }

  void _goToAddContact(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddContact()),
    );
    if (result.name != '' && result.phone != '') {
      this.setState(() {
        this
            .widget
            .listContact
            .add(DetailContact(name: result.name, phone: result.phone));
      });
    }
  }

  void _showAlert(BuildContext context, int index) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Delete"),
              content: Text("Do you want delete it?"),
              actions: [
                FlatButton(
                  child: Text(
                    "Yes",
                  ),
                  onPressed: () {
                    _removeContact(index);
                    Navigator.of(context).pop();
                  },
                ),
                FlatButton(
                  child: Text(
                    "No",
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }

  void _removeContact(int index) async {
    this.setState(() {
      this.widget.listContact.removeAt(index);
    });
  }

  Future<void> _pullRefresh() async {
    return this.setState(() {
      this.widget.listContact = [];
    });
  }
}
