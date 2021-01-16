import 'package:cityX/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> pothole = <String>[];

  TextEditingController nameController = TextEditingController();

  void addItemToList() {
    setState(() {
      final String potn = nameController.text;

      pothole.insert(0, potn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CITYX POTHOLES'),
      ),
      body: Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.all(20),
        ),
        RaisedButton(
          child: Text('Add a pothole'),
          onPressed: () {
            addItemToList();
          },
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (_, int index) {
              return ListTile(
                title: Text('Pothole$index'),
                subtitle: Text('location'),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Details(index)));
                },
              );
            },
            itemCount: pothole.length,
          ),
        )
      ]),
    );
  }
}
