import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:ventelibre/model/articleModel.dart';
//import 'package:ventelibre/model/articleModel.dart';
//import 'package:ventelibre/categorie/articleCategorie.dart';

class DatabaseService {
  String? userID, articleID;
  CollectionReference _articles =
      FirebaseFirestore.instance.collection('articles');
  FirebaseStorage _storage = FirebaseStorage.instance;

  //upload l'image vers Firebase storage

  Future<String> uploadFile(file) async {
    Reference reference =
        _storage.ref().child('articles/${DateTime.now()}.png');
    UploadTask uploadTask = reference.putFile(file);
    TaskSnapshot taskSnapshot = await uploadTask;
    return await taskSnapshot.ref.getDownloadURL();
  }

  // Ajouter l'article dans la base de donnees

  void addArticle(Article article) {
    _articles.add({
      "nomArticle": article.nomArticle,
      "articleUrlImg": article.articleUrlImg,
      "articleUserID": article.articleUserID,
      "articleUserName": article.articleUserName,
      //"details": article.details,
      "articleTimestamp": FieldValue.serverTimestamp(),
      "articleFavoriteCount": 0,
    });
  }

  // récupération de tout les articles en temps réel
  Stream<List<Article>> get articles {
    Query queryArticles =
        _articles.orderBy('articleTimestamp', descending: true);
    return queryArticles.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Article(
            articleID: doc.id,
            nomArticle: doc.get('nomArticle'),
            articleUrlImg: doc.get('articleUrlImg'),
            articleUserID: doc.get('articleUserID'),
            articleUserName: doc.get('articleUserName'),
            articleFavoriteCount: doc.get('articleFavoriteCount'),
            articleTimestamp: doc.get('articleTimestamp'));
      }).toList();
    });
  }

  // ajout de la voiture favoris dans une sous-collection
  void addFavoriteCar(Article article, String userID) async {
    final carDocRef = _articles.doc(article.articleID);
    final favoritedBy = carDocRef.collection('favoritedBy');
    int carFavoriteCount = article.articleFavoriteCount!;
    int increaseCount = carFavoriteCount += 1;
    favoritedBy.doc(userID).set({
      "carName": article.nomArticle,
      "carUrlImg": article.articleUrlImg,
      "carUserID": article.articleUserID,
      "carUserName": article.articleUserName,
      "carTimestamp": article.articleTimestamp,
      "carFavoriteCount": increaseCount,
    });
    carDocRef.update({"carFavoriteCount": increaseCount});
  }

  // suppression de la voiture
  /*  Future<void> deleteArticle(String articleID) => _articles.doc(articleID).delete();

  // Récuperation de toutes les voitures en temps réel
  Stream<List<Article>> get articles {
    Query queryArticles = _articles.orderBy('carTimestamp', descending: true);
    return queryArticles.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Article(
          articleID: doc.id,
          nomArticle: doc.get('nomArticle'),
          articleUrlImg: doc.get('articleUrlImg'),
          articleUserID: doc.get('articleUserID'),
          articleUserName: doc.get('articleUserName'),
          articleFavoriteCount: doc.get('articleFavoriteCount'),
          articleTimestamp: doc.get('articleTimestamp'),
        );
      }).toList();
    });
  } */
}
