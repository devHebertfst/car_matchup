import 'package:flutter/material.dart';

class Noticias4 extends StatelessWidget {
  const Noticias4({super.key});

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
              image: AssetImage('assets/images/Image25.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 16),
        Text(
          'Lei quer isentar donos de carros usados de dívidas feitas antes da revenda',
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
          'Você já se deparou com um veículo usado sendo vendido por um preço irresistível? Muitas vezes, a pegadinha pode estar nos débitos que esse carro carrega escondido, incluindo multas, tributos e encargos. Leia mais em: https://quatrorodas.abril.com.br/noticias/lei-quer-isentar-donos-de-carros-usados-de-dividas-feitas-antes-da-revenda',
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
