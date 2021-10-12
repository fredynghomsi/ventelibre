import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ventelibre/home/profile/profileAppBar.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<User?>(context);
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          ProfileAppBar(
            user: _user,
          )
        ],
      )),
    );
  }
}
