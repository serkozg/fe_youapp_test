import 'package:flutter/material.dart';
import 'package:flutter_tags_x/flutter_tags_x.dart';
import 'package:textfield_tags/textfield_tags.dart';

class EditInterestPage extends StatefulWidget {
  @override
  State<EditInterestPage> createState() => _EditInterestPageState();
}

class _EditInterestPageState extends State<EditInterestPage> {
  final GlobalKey<TagsState> _globalKey = GlobalKey<TagsState>();
  // List tags = [];
  List<String> tags = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(23, 50, 55, 1)),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(23, 50, 55, 1),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.white,
                    ),
                    Text(
                      'Back',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 20, 20, 8),
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.blue, fontSize: 17),
                ),
              ),
            )
          ],
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: page_body(),
        ),
      ),
    );
  }

  Widget page_body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(23, 175, 1, 5),
          child: Text(
            'Tell everyone about yourself',
            style: TextStyle(
                color: Color.fromRGBO(220, 203, 157, 1), fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(22, 1, 1, 1),
          child: Text(
            'What interest you?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: TextFieldTags(
            textSeparators: [" ", ','],
            initialTags: tags,
            onTag: (tag) {
              tags.add(tag);
            },
            onDelete: (tag) {
              tags.remove(tag);
            },
            tagsStyler: TagsStyler(
                tagTextStyle: TextStyle(fontWeight: FontWeight.normal),
                tagDecoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(0.0),
                ),
                tagCancelIcon:
                    Icon(Icons.cancel, size: 18.0, color: Colors.green[100]),
                tagPadding: EdgeInsets.all(6.0)),
            textFieldStyler: TextFieldStyler(
                helperText: '',
                textFieldBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2))),
          ),
        ),
      ],
    );
  }
}
