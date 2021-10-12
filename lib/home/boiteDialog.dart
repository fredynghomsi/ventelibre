import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ventelibre/model/articleModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:ventelibre/categorie/articleCategorie.dart';
import 'package:ventelibre/services/dbServices.dart';
import 'package:ventelibre/shared-ui/showSnackBar.dart';

class ArticleDialog {
  User? user;
  ArticleDialog({this.user});
  void showArticleDialog(BuildContext context, ImageSource source) async {
    //PickedFile? _pickedFile = await ImagePicker().getImage(source: source);
    XFile? _pickedFile = await ImagePicker().pickImage(source: source);
    File _file = File(_pickedFile!.path);
    final _keyForm = GlobalKey<FormState>();
    String _nomArticle = '';
    String _details = '';
    int _prix = 0;
    String _formError = 'Veillez renseigner le nom du produit svp!';
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            contentPadding: EdgeInsets.zero,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                margin: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    color: Colors.grey,
                    image: DecorationImage(
                      image: FileImage(_file),
                      fit: BoxFit.cover,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Form(
                      key: _keyForm,
                      child: Column(
                        children: [
                          TextFormField(
                            maxLength: 20,
                            onChanged: (value) => _nomArticle = value,
                            validator: (value) =>
                                _nomArticle == '' ? _formError : null,
                            decoration: InputDecoration(
                                labelText: 'Nom du produit',
                                border: OutlineInputBorder()),
                          ),
                          /* flutter  */
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Wrap(
                        children: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text('ANNULER'),
                          ),
                          ElevatedButton(
                            onPressed: () => onSubmit(
                                context, _keyForm, _file, _nomArticle, user),
                            child: Text('PUBLIER'),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        });
  }

  void onSubmit(context, keyForm, file, nomArticle, user) async {
    if (keyForm.currentState!.validate()) {
      Navigator.of(context).pop();
      showNotification(context, "Chargement....");
      //try {
      DatabaseService db = DatabaseService();
      String _articleUrlImg = await db.uploadFile(file);
      db.addArticle(
        Article(
            nomArticle: nomArticle,
            articleUrlImg: _articleUrlImg,
            articleUserID: user!.uid,
            articleUserName: user!.displayName),
      );
      /* } catch (error) {
        print('Echec de la sauvegarde');
      } */
    }
  }
}
