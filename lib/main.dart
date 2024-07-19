import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:car_matchup/Pages/login_page.dart';
import 'package:car_matchup/Models/Custom_page.dart';
import 'package:car_matchup/Models/favorites_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MainApp());
  });
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Car Matchup',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AuthCheck(),
    );
  }
}

class AuthCheck extends StatelessWidget {
  const AuthCheck({Key? key}) : super(key: key);

  Future<void> _initializeApp() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FavoritesManager.carregarFavoritos();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Erro ao carregar dados do usuário'));
        } else {
          User? user = FirebaseAuth.instance.currentUser;
          if (user != null) {
            return CustomPage();
          } else {
            return LoginPage();
          }
        }
      },
    );
  }
}
