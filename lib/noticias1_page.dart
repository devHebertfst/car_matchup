import 'package:flutter/material.dart';

class Noticias1 extends StatelessWidget {
  const Noticias1({super.key});

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
              image: AssetImage('assets/images/Image23.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 16),
        Text(
          'Omoda/Jaecoo avança negociações para comprar fábrica da Caoa Chery',
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
          'A Omoda/Jaecoo começa a vender seus carros no Brasil em agosto, mas a operação que comanda as duas marcas já tem no seu horizonte a necessidade de ter uma fábrica no Brasil para aumentar o volume de vendas. Leia mais em: https://quatrorodas.abril.com.br/noticias/omoda-jaecoo-avanca-negociacao-para-comprar-fabrica-da-caoa-chery',
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
