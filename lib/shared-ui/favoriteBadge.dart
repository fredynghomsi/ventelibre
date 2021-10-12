import 'package:flutter/material.dart';
import 'package:ventelibre/model/articleModel.dart';

class FavoriteBadge extends StatefulWidget {
  const FavoriteBadge({this.userID, this.article});
  final Article? article;
  final String? userID;

  @override
  _FavoriteBadgeState createState() => _FavoriteBadgeState();
}

class _FavoriteBadgeState extends State<FavoriteBadge> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 4.0,
      right: 12.0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
        ),
        child: widget.article!.isMyFavoritedArticle!
            ? Row(
                children: [
                  Text(
                    '${widget.article!.articleFavoriteCount}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                ],
              )
            : Row(),
      ),
    );
  }
}
