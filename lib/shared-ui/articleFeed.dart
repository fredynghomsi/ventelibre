import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:ventelibre/model/articleModel.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:ventelibre/shared-ui/favoriteBadge.dart';
//import 'package:ventelibre/categorie/articleCategorie.dart';

class ArticleFeed extends StatelessWidget {
  final Article? article;
  final String? userID;
  const ArticleFeed({this.article, this.userID});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(article!.articleUrlImg!))),
    );
  }
}
