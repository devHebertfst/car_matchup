import 'dart:convert';
import 'package:car_matchup/car_modelo.dart';
import 'package:car_matchup/car_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'result_page.dart';
import 'fipe_form.dart';
import 'car_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CarModel> _carros = [];

  @override
  void initState() {
    super.initState();
    _loadCarros();
  }

  Future<void> _loadCarros() async {
    final String response = await rootBundle.loadString('assets/json/carros.json');
    final List<dynamic> data = json.decode(response);
    setState(() {
      _carros = data.map((item) => CarModel.fromJson(item)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
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
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
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
                              const Divider(
                                color: Color.fromRGBO(255, 92, 0, 1),
                                thickness: 1,
                                height: 10,
                                indent: 30,
                                endIndent: 30,
                              ),
                            ],
                          ),
                          content: FipeForm(
                            onSubmit: (tipo, marca, modelo, ano) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ResultPage(
                                    tipo: tipo,
                                    marca: marca,
                                    modelo: modelo,
                                    ano: ano,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 40),
            Container(
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: _carros.map((car) => CarTile(car: car)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
