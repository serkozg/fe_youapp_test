import 'package:flutter/material.dart';
import 'package:youapptest/interest_page.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ProfilPage extends StatefulWidget {
  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  TextEditingController _displaynameController = TextEditingController();
  bool edit_about = true;
  bool save_about = true;

  String _genderValue = "Male";
  var item = ["Male", "Female"];

  void tap_edit_about() {
    setState(() {
      edit_about = !edit_about;
    });
  }

  void tap_save_about() {
    setState(() {
      save_about = !save_about;
    });
  }

  var maskFormatter = new MaskTextInputFormatter(
      mask: '##/##/####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(9, 20, 26, 0)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '@johndoe',
            style: TextStyle(fontSize: 14),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          leading: Row(
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
          actions: [
            Icon(
              Icons.more_horiz,
              color: Colors.white,
            )
          ],
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(child: page_body()),
      ),
    );
  }

  Widget page_body() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        //image
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              height: height * 0.27,
              width: width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color.fromRGBO(22, 35, 41, 1)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(1, 15, 20, 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.border_color,
                          color: Colors.white,
                          size: 14,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 1, 1, 20),
                    child: Text(
                      '@johndoe123,',
                      style: TextStyle(color: Color.fromRGBO(83, 91, 95, 2)),
                    ),
                  ),
                ],
              )),
        ),
        //about
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: edit_about
              ? Container(
                  height: height * 0.13,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color.fromRGBO(14, 25, 31, 2)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 1, 25, 1),
                        child: InkWell(
                          onTap: () {
                            tap_edit_about();
                          },
                          child: edit_about
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'About',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Icon(
                                      Icons.border_color,
                                      color: Colors.white,
                                      size: 14,
                                    )
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'About',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Text(
                                        'Save & Update',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(255, 215, 0, 1),
                                            fontSize: 13),
                                      ),
                                    )
                                  ],
                                ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 1, 1, 1),
                        child: Text(
                          'Add in your your to help others know you better',
                          style:
                              TextStyle(color: Color.fromRGBO(83, 91, 95, 2)),
                        ),
                      ),
                    ],
                  ),
                )
              : save_about
                  ? Container(
                      height: height * 0.63,
                      width: width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color.fromRGBO(14, 25, 31, 2)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 17, 1, 1),
                                child: Text(
                                  'About',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(1, 17, 20, 1),
                                child: InkWell(
                                  onTap: () {
                                    tap_save_about();
                                  },
                                  child: Text(
                                    'Save & Update',
                                    style: TextStyle(
                                        color:
                                            Color.fromRGBO(163, 150, 126, 2)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(50, 25, 170, 1),
                            child: Stack(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color.fromRGBO(33, 43, 49, 2)),
                                ),
                                Positioned(
                                  child: Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.add,
                                          size: 43,
                                          color:
                                              Color.fromRGBO(163, 150, 126, 2),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Text(
                                        'Add Image',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 30, 1, 1),
                                  child: Text(
                                    'Display name : ',
                                    style: TextStyle(
                                        color: Color.fromRGBO(63, 77, 72, 2),
                                        fontSize: 13),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(1, 30, 10, 1),
                                child: SizedBox(
                                  width: 220,
                                  child: TextFormField(
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13),
                                    textAlign: TextAlign.end,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      hintText: 'Enter name ',
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 10),
                                      fillColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 2.0,
                                        ),
                                      ),
                                      contentPadding: const EdgeInsets.all(6),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 15, 1, 1),
                                  child: Text(
                                    'Gender : ',
                                    style: TextStyle(
                                        color: Color.fromRGBO(63, 77, 72, 2),
                                        fontSize: 13),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(1, 15, 10, 1),
                                child: SizedBox(
                                  width: 220,
                                  child: Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(10),
                                        border:
                                            Border.all(color: Colors.white)),
                                    child: DropdownButton(
                                      items: item.map((String item) {
                                        return DropdownMenuItem(
                                            value: item,
                                            child: Text(
                                              item,
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ));
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          _genderValue = newValue!;
                                        });
                                      },
                                      borderRadius: BorderRadius.circular(30),
                                      value: _genderValue,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 15, 1, 1),
                                  child: Text(
                                    'Birthday : ',
                                    style: TextStyle(
                                        color: Color.fromRGBO(63, 77, 72, 2),
                                        fontSize: 13),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(1, 15, 10, 1),
                                child: SizedBox(
                                  width: 220,
                                  child: TextFormField(
                                    keyboardType: TextInputType.datetime,
                                    inputFormatters: [maskFormatter],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13),
                                    textAlign: TextAlign.end,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      hintText: 'DD/MM/YYYY',
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 10),
                                      fillColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 2.0,
                                        ),
                                      ),
                                      contentPadding: const EdgeInsets.all(6),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 15, 1, 1),
                                  child: Text(
                                    'Horoscope : ',
                                    style: TextStyle(
                                        color: Color.fromRGBO(63, 77, 72, 2),
                                        fontSize: 13),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(1, 15, 10, 1),
                                child: SizedBox(
                                  width: 220,
                                  child: TextFormField(
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13),
                                    textAlign: TextAlign.end,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      hintText: 'Horoscope',
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 10),
                                      fillColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 2.0,
                                        ),
                                      ),
                                      contentPadding: const EdgeInsets.all(6),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 15, 1, 1),
                                  child: Text(
                                    'Zodiac : ',
                                    style: TextStyle(
                                        color: Color.fromRGBO(63, 77, 72, 2),
                                        fontSize: 13),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(1, 15, 10, 1),
                                child: SizedBox(
                                  width: 220,
                                  child: TextFormField(
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13),
                                    textAlign: TextAlign.end,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      hintText: 'Zodiac',
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 10),
                                      fillColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 2.0,
                                        ),
                                      ),
                                      contentPadding: const EdgeInsets.all(6),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 15, 1, 1),
                                  child: Text(
                                    'Height : ',
                                    style: TextStyle(
                                        color: Color.fromRGBO(63, 77, 72, 2),
                                        fontSize: 13),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(1, 15, 10, 1),
                                child: SizedBox(
                                  width: 220,
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13),
                                    textAlign: TextAlign.end,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      hintText: 'Add height',
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 10),
                                      fillColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 2.0,
                                        ),
                                      ),
                                      contentPadding: const EdgeInsets.all(6),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 15, 1, 1),
                                  child: Text(
                                    'Weight : ',
                                    style: TextStyle(
                                        color: Color.fromRGBO(63, 77, 72, 2),
                                        fontSize: 13),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(1, 15, 10, 1),
                                child: SizedBox(
                                  width: 220,
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13),
                                    textAlign: TextAlign.end,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      hintText: 'Add weight',
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 10,
                                      ),
                                      fillColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 2.0,
                                        ),
                                      ),
                                      contentPadding: const EdgeInsets.all(6),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  : Container(
                      height: height * 0.27,
                      width: width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color.fromRGBO(14, 25, 31, 2)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 17, 1, 1),
                                child: Text(
                                  'About',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(1, 17, 20, 1),
                                child: InkWell(
                                  onTap: () {
                                    tap_edit_about();
                                  },
                                  child: Icon(
                                    Icons.border_color,
                                    color: Colors.white,
                                    size: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 20, 1, 3),
                            child: Row(
                              children: [
                                Text(
                                  "Birthday : ",
                                  style: TextStyle(
                                      color: Color.fromRGBO(63, 77, 72, 2)),
                                ),
                                Text(
                                  "28/08/1995 (Age 28)",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 1, 3),
                            child: Row(
                              children: [
                                Text(
                                  "Horoscope : ",
                                  style: TextStyle(
                                      color: Color.fromRGBO(63, 77, 72, 2)),
                                ),
                                Text(
                                  "Virgo",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 1, 3),
                            child: Row(
                              children: [
                                Text(
                                  "Zodiac : ",
                                  style: TextStyle(
                                      color: Color.fromRGBO(63, 77, 72, 2)),
                                ),
                                Text(
                                  "Pig",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 1, 3),
                            child: Row(
                              children: [
                                Text(
                                  "Height : ",
                                  style: TextStyle(
                                      color: Color.fromRGBO(63, 77, 72, 2)),
                                ),
                                Text(
                                  "175 cm",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 1, 3),
                            child: Row(
                              children: [
                                Text(
                                  "Weight : ",
                                  style: TextStyle(
                                      color: Color.fromRGBO(63, 77, 72, 2)),
                                ),
                                Text(
                                  "69 kg",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
        ),
        //interest
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              height: height * 0.1,
              width: width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color.fromRGBO(14, 25, 31, 2)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 1, 25, 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Interest',
                          style: TextStyle(color: Colors.white),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => EditInterestPage()));
                          },
                          child: Icon(
                            Icons.border_color,
                            color: Colors.white,
                            size: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 1, 1, 1),
                    child: Text(
                      'Add in your interest to find a better match',
                      style: TextStyle(color: Color.fromRGBO(83, 91, 95, 2)),
                    ),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}
