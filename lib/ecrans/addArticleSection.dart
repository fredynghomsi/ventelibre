import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ventelibre/home/boiteDialog.dart';

class AddArticleSection extends StatelessWidget {
  final User? user;
  const AddArticleSection({this.user});

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate([
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Salut'),
                Text(user!.displayName!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ))
              ],
            ),
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.grey[300]),
                  child: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                ),
                Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 8.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                    //color: Colors.red[300]
                  ),
                  child: IconButton(
                      onPressed: () => showArticleDialog(context, user!),
                      // onPressed: () {},
                      icon: Icon(Icons.add)),
                )
              ],
            )
          ],
        ),
      )
    ]));
  }

  void showArticleDialog(BuildContext context, User user) {
    ArticleDialog(user: user).showArticleDialog(context, ImageSource.gallery);
  }
}
