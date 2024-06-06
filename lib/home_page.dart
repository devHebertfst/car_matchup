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
  Map<String, List<CarModel>> _carrosPorCategoria = {};

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
      _carrosPorCategoria = _categorizeCarros(_carros);
    });
  }

  Map<String, List<CarModel>> _categorizeCarros(List<CarModel> carros) {
    Map<String, List<CarModel>> categorizedCarros = {};
    for (var car in carros) {
      if (categorizedCarros.containsKey(car.categoria)) {
        categorizedCarros[car.categoria]!.add(car);
      } else {
        categorizedCarros[car.categoria] = [car];
      }
    }
    return categorizedCarros;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Tabela Fipe Button
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
              // Horizontal ListView
              Container(
                height: 160,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: _carros.map((car) => CarTile(car: car)).toList(),
                ),
              ),
              const SizedBox(height: 40),
              ..._buildCarCategorySections(),
            ],
          ),
        ),
      ),
    );
  }

List<Widget> _buildCarCategorySections() {
  List<Widget> sections = [];
  _carrosPorCategoria.forEach((categoria, carros) {
    sections.add(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(9, 0, 0, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '$categoria',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: carros.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CarDetailPage(car: carros[index]),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          carros[index].imagens[0], // Aqui estamos usando apenas a primeira imagem do carro
                          width: 150,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Text(
                        carros[index].modelo,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1, // Limita a duas linhas para evitar expansão vertical excessiva
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        carros[index].preco,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  });
  return sections;
}




}
