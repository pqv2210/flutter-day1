import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'AddContact.dart';
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
  Widget build(BuildContext context) {
    print(this.widget.listContact);
    final title = 'List Contact';

    return MaterialApp(
        title: title,
        home: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: ListView.builder(
            itemCount: this.widget.listContact.length,
            itemBuilder: (context, index) {
              return ListTile(
                  title: Text('${this.widget.listContact[index]}'),
                  onTap: () {
                    print(index);
                  });
            },
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
}
