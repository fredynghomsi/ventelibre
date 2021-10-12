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
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                color: Colors.grey,
                image: DecorationImage(
                  image: NetworkImage(article!.articleUrlImg!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            FavoriteBadge(article: article!, userID: userID),
          ],
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article!.nomArticle!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Publié par: ${article!.articleUserName}'),
                  ],
                ),
                Text(formattingDate(article!.articleTimestamp)),
              ]),
        )
      ],
    );
  }

  String formattingDate(Timestamp? timestamp) {
    initializeDateFormatting('fr', null);
    DateTime? dateTime = timestamp?.toDate();
    DateFormat dateFormat = DateFormat.MMMd('fr');
    return dateFormat.format(dateTime ?? DateTime.now());
  }
}
