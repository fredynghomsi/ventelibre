import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ventelibre/ecrans/categorie/category_widget.dart';
import 'package:ventelibre/home/addArticleSection.dart';
import 'package:ventelibre/ecrans/shared-ui/articleList.dart';
import 'package:ventelibre/home/categorieSection.dart';
import 'package:ventelibre/home/homeAppBar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<User?>(context);
    return Scaffold(
        body: SafeArea(
      child: CustomScrollView(slivers: [
        HomeAppBar(user: _user),
        //categorieWidget(),
        AddArticleSection(user: _user),
        CategorieSection(),
        ArticleList(userID: _user!.uid),
        /* Container(
          height: 35,
          child: Column(
            children: [categorieWidget()],
          ),
        ), */
      ]),
    ));
  }
}
