import 'package:cloud_firestore/cloud_firestore.dart';

class Article {
  String? articleID, nomArticle, articleUrlImg, articleUserID, articleUserName;
  //String? details;
  Timestamp? articleTimestamp;
  bool? isMyFavoritedArticle;
  int? articleFavoriteCount;

  Article(
      {this.articleID,
      this.nomArticle,
      this.articleUrlImg,
      this.articleUserID,
      this.articleUserName,
      this.articleTimestamp,
      this.articleFavoriteCount,
      //this.details,
      this.isMyFavoritedArticle});
}
