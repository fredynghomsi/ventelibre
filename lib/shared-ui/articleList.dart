import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ventelibre/model/articleModel.dart';
import 'package:ventelibre/shared-ui/articleFeed.dart';

class ArticleList extends StatelessWidget {
  final String? userID;
  const ArticleList({this.userID});

  @override
  Widget build(BuildContext context) {
    final _articles = Provider.of<List<Article>>(context);
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (_, index) {
          return ArticleFeed(article: _articles[index], userID: userID);
        },
        childCount: _articles.length,
      ),
    );
  }
}
