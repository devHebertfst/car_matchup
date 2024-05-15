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
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromRGBO(255, 92, 0, 1),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
                textStyle: const TextStyle(fontSize: 24),
              ),
              icon: const Icon(
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
              onPressed: (){
                showDialog(
                context: context, 
                builder: (context) =>AlertDialog(
                  backgroundColor: Colors.white,
                  title: Column(
                      children: [
                        Text(
                          'Tabela Fipe',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(255, 92, 0, 1),  
                            fontSize: 20,
                          ),
                        ),
                        const Divider( // Linha abaixo do título
                          color: Color.fromRGBO(255, 92, 0, 1),
                          thickness: 1,
                          height: 10,
                          indent: 30,
                          endIndent: 30,
                        ),
                      ],
                    ),
                content: Container(
                  height: 400,
                  child: Column(
                    children: [
                      DropdownMenu(
                        width: 170,
                        label: Text(
                          'Tipo',
                          style: GoogleFonts.poppins(
                          color: Color.fromRGBO(169, 169, 169, 1),
                          fontWeight: FontWeight.w400,
                          ),
                        ),
                        dropdownMenuEntries: <DropdownMenuEntry<Color>>[
                          DropdownMenuEntry(value: Colors.red, label: 'Red'),
                          DropdownMenuEntry(value: Colors.blue, label: 'Blue'),
                          DropdownMenuEntry(value: Colors.green, label: 'Green'),
                          DropdownMenuEntry(value: Colors.yellow, label: 'Yellow'),
                  
                        ]),
                      const SizedBox(height: 20),
                      DropdownMenu(
                        width: 170,
                        label: Text(
                          'Marca',
                          style: GoogleFonts.poppins(
                          color: Color.fromRGBO(169, 169, 169, 1),
                          fontWeight: FontWeight.w400,
                          ),
                        ),
                        dropdownMenuEntries: <DropdownMenuEntry<Color>>[
                          DropdownMenuEntry(value: Colors.red, label: 'Red'),
                          DropdownMenuEntry(value: Colors.blue, label: 'Blue'),
                          DropdownMenuEntry(value: Colors.green, label: 'Green'),
                          DropdownMenuEntry(value: Colors.yellow, label: 'Yellow'),
                  
                        ]),
                      const SizedBox(height: 20),
                  
                      DropdownMenu(
                        width: 170,
                        label: Text(
                          'Modelo',
                          style: GoogleFonts.poppins(
                          color: Color.fromRGBO(169, 169, 169, 1),
                          fontWeight: FontWeight.w400,
                          ),
                        ),
                        dropdownMenuEntries: <DropdownMenuEntry<Color>>[
                          DropdownMenuEntry(value: Colors.red, label: 'Red'),
                          DropdownMenuEntry(value: Colors.blue, label: 'Blue'),
                          DropdownMenuEntry(value: Colors.green, label: 'Green'),
                          DropdownMenuEntry(value: Colors.yellow, label: 'Yellow'),
                  
                        ]),
                      const SizedBox(height: 20),
                      DropdownMenu(
                        width: 170,
                        label: Text(
                          'Ano',
                          style: GoogleFonts.poppins(
                          color: Color.fromRGBO(169, 169, 169, 1),
                          fontWeight: FontWeight.w400,
                          ),
                        ),
                        dropdownMenuEntries: <DropdownMenuEntry<Color>>[
                          DropdownMenuEntry(value: Colors.red, label: 'Red'),
                          DropdownMenuEntry(value: Colors.blue, label: 'Blue'),
                          DropdownMenuEntry(value: Colors.green, label: 'Green'),
                          DropdownMenuEntry(value: Colors.yellow, label: 'Yellow'),
                  
                        ]),
                      const SizedBox(height: 20),
                      TextButton(
                        style: TextButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(255, 92, 0, 1),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
                        textStyle: const TextStyle(fontSize: 15),
                        ),
                        onPressed: null,
                        child: Text(
                          'Pesquisar',
                          style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          ),
                        ),
                      )
                  ],
                  ),
                ),
                ));
              },
            ),
          ],
                       ),
      ),
    );
  }
}