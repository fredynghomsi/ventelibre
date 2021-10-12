import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Connexion avec Google
  Future<UserCredential> signInWithGoogle() async {
    //Déclancher le flux d'authentification
    //final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final googleUser = await _googleSignIn.signIn();

    //Obtention des détails d'autorisation de la demande

    final googleAuth = await googleUser!.authentication;

    //Creation d'un nouvel identifiant
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Une fois connecté renvoyons l'identifiant de l'utilisateur
    return await _auth.signInWithCredential(credential);
  }

  // L'état de l'utilisateur en temps réel
  Stream<User?> get user => _auth.authStateChanges();

  //Deconnexion
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}
