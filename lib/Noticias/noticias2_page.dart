import 'package:flutter/material.dart';

class Noticias2 extends StatelessWidget {
  const Noticias2({super.key});

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
              image: AssetImage('assets/images/Image24.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 16),
        Text(
          'Mitsubishi L200 Triton Sport ganha duas edições limitadas a 200 unidades',
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
          'A Mitsubishi acaba de apresentar duas novas séries especiais para a L200 Triton Sport. As versões Terra e Urban, como os nomes sugerem, tem inspiração no meio rural e urbano, respectivamente, e chegam... Leia mais em: https://quatrorodas.abril.com.br/noticias/mitsubishi-l200-triton-sport-ganha-duas-edicoes-limitadas-a-200-unidades',
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