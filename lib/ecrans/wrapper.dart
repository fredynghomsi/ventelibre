import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ventelibre/home/home.dart';
import 'package:ventelibre/ecrans/login.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<User?>(context);
    return _user == null ? Login() : Home();
    /* if (_user == null) {
      return Login();
    } else {
      return Home();
    } */
  }
}
