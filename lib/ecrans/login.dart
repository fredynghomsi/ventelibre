import 'package:flutter/material.dart';
import 'package:ventelibre/services/authentification.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // processus de chargement de connexion
  bool inLoadingProcess = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.40,
            decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                    image: AssetImage('assets/vente.jpg'), fit: BoxFit.cover)),
          ),
          Text(
            'Ventelibre',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(color: Colors.black54, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Application de vente 100% libre au Cameroun',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4?.copyWith(
                  color: Colors.black54, fontWeight: FontWeight.bold),
            ),
          ),
          inLoadingProcess
              ? Center(child: CircularProgressIndicator())
              : ElevatedButton(
                  onPressed: () => signIn(),
                  child: Text('Connectez-vous avec Google'))
        ],
      ),
    )));
  }

  signIn() {
    inLoadingProcess = true;
    AuthService().signInWithGoogle();
  }
}
