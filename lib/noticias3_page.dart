import 'package:flutter/material.dart';

class Noticias3 extends StatelessWidget {
  const Noticias3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Detalhes da Notícia',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            Noticia1(),
          ],
        ),
    );
  }
}

class Noticia1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 250,
          decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage('assets/images/Image22.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 16),
        Text(
          'De Saveiro a L200: as 10 picapes mais baratas do Brasil em 2024',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16),
        Text(
          'As picapes tiveram um crescimento exponencial no mercado brasileiro nos últimos anos, tanto em quantidade de modelos, quanto em vendas. No primeiro trimestre deste ano, segundo a Fenabrave, elas ficar... \n\nLeia mais em: https://quatrorodas.abril.com.br/noticias/de-saveiro-a-l200-as-10-picapes-mais-baratas-do-brasil-em-2024/',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
