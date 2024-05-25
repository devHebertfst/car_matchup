import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PessoaPage extends StatefulWidget {
  const PessoaPage({super.key});

  @override
  State<PessoaPage> createState() => _PessoaPageState();
}

class _PessoaPageState extends State<PessoaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: <Widget> [
            Text(
              'Seu carro',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700,
                fontSize: 32,
                letterSpacing: 1,
              ),
            ),
            Text(
              'Selecione um carro na tela de favoritos',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 24,
                letterSpacing: 1,
              ),
            ),
        ],),
      ),
    );
  }
}