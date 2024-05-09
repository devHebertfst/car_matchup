import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              style: TextButton.styleFrom(
                backgroundColor: Color.fromRGBO(255, 92, 0, 1),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                padding: const EdgeInsets.fromLTRB(80, 30, 80, 30),
                textStyle: const TextStyle(fontSize: 24),
              ),
              icon: Icon(
                Icons.search_rounded,
                color: Colors.white,
                size: 25,
              ),
              label: Text(
                  'Tabela Fipe',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              onPressed: null,
            ),
          ],
        ),
      ),
    );
  }
}