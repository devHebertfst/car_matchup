import 'package:car_matchup/Noticias/noticias1_page.dart';
import 'package:car_matchup/Noticias/noticias2_page.dart';
import 'package:car_matchup/Noticias/noticias3_page.dart';
import 'package:car_matchup/Noticias/noticias4_page.dart';
import 'package:flutter/material.dart';

class NoticiasPage extends StatefulWidget {
  const NoticiasPage({super.key});

  @override
  State<NoticiasPage> createState() => _NoticiasPageState();
}

class _NoticiasPageState extends State<NoticiasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: 414,
              height: 100,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 44,
                    left: 0,
                    child: Container(
                      width: 414,
                      height: 56,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                                size: 24,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Noticias do momento',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                fontSize: 24,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: <Widget>[
                  buildNewsCard(
                    'assets/images/Image23.png',
                    'Omoda/Jaecoo avança negociações para comprar fábrica da Caoa Chery',
                    context,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Noticias1()),
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  buildNewsCard(
                    'assets/images/Image24.png',
                    'Mitsubishi L200 Triton Sport ganha duas edições limitadas a 200 unidades',
                    context,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Noticias2()),
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  buildNewsCard(
                    'assets/images/Image22.png',
                    'De Saveiro a L200: as 10 picapes mais baratas do Brasil em 2024',
                    context,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Noticias3()),
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  buildNewsCard(
                    'assets/images/Image25.png',
                    'Lei quer isentar donos de carros usados de dívidas feitas antes da revenda',
                    context,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Noticias4()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNewsCard(String imagePath, String newsTitle, BuildContext context, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 190,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: Offset(0, 4),
              blurRadius: 4,
            ),
          ],
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
        ),
        child: Row(
          children: <Widget>[
            Container(
              width: 140,
              height: 120,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  newsTitle,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    height: 1.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}