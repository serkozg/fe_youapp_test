import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:youapptest/auth/global.dart';
import 'package:youapptest/profil_page.dart';
import 'package:youapptest/register_page.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordVisible = true;
  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(47, 79, 79, 1),
      ),
      child: Scaffold(
        appBar: AppBar(
          // title: Text('Hak & Kewajiban Pasien'),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          leading: Row(
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
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(child: page_body()),
      ),
    );
  }

  Widget page_body() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(10, 1, 240, 1),
            child: title_page_body(),
          ),
          SizedBox(
            height: 40,
          ),
          InputFieldUser(
            'Enter Username/Email',
            usernameController,
          ),
          SizedBox(
            height: 20,
          ),
          InputFieldPassword(
            'Enter Password',
            passwordController,
          ),
          SizedBox(
            height: 50,
          ),
          loginButton(),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(70, 1, 10, 1),
            child: ExtraText(),
          ),
        ],
      ),
    );
  }

  Future<http.Response> login_post() async {
    Map data = {
      "email": usernameController.text,
      "username": usernameController.text,
      "password": passwordController.text
    };

    var response =
        await http.post(Uri.parse(baseURL + 'api/login'), body: data);
    if (response.statusCode == 201) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => ProfilPage()),
          (route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Sorry an error occurred'),
        ),
      );
    }
    print("${response.statusCode}");
    print("${response.body}");
    return response;
  }

  Widget title_page_body() {
    return Text(
      'Login',
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
    );
  }

  Widget InputFieldUser(String textInput, TextEditingController controller) {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide(color: Colors.white));

    return TextField(
      style: TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
        hintText: textInput,
        hintStyle: TextStyle(color: Colors.white, fontSize: 13),
        enabledBorder: border,
        focusedBorder: border,
      ),
    );
  }

  Widget InputFieldPassword(
      String textInput, TextEditingController controller) {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide(color: Colors.white));

    return TextField(
      style: TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
        hintText: textInput,
        hintStyle: TextStyle(color: Colors.white, fontSize: 13),
        enabledBorder: border,
        focusedBorder: border,
        suffixIcon: IconButton(
          icon: Icon(passwordVisible ? Icons.visibility_off : Icons.visibility),
          onPressed: () {
            togglePassword();
          },
        ),
      ),
      obscureText: passwordVisible,
    );
  }

  Widget loginButton() {
    return ElevatedButton(
      onPressed: () {
        if (passwordController.text.isNotEmpty &&
            usernameController.text.isNotEmpty) {
          login_post();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Enter the data correctly and not empty'),
            ),
          );
        }
      },
      child: SizedBox(
        width: double.infinity,
        child: Text(
          'Login',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          primary: Colors.cyan,
          onPrimary: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 13)),
    );
  }

  Widget ExtraText() {
    return Center(
      child: Center(
        child: Row(
          children: [
            Text(
              'No Account? ',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => RegisterPage()));
              },
              child: Text(
                'Register here',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.yellow,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
