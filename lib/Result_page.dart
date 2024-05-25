import 'package:car_matchup/carro.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ResultPage extends StatefulWidget {
  final String tipo;
  final String marca;
  final String modelo;
  final String ano;

  ResultPage({required this.tipo, required this.marca, required this.modelo, required this.ano});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  Map<String, dynamic>? vehicleData;

  @override
  void initState() {
    super.initState();
    fetchVehicleData();
  }

  Future<void> fetchVehicleData() async {
    final response = await http.get(Uri.parse('https://parallelum.com.br/fipe/api/v1/${widget.tipo}/marcas/${widget.marca}/modelos/${widget.modelo}/anos/${widget.ano}'));
    if (response.statusCode == 200) {
      setState(() {
        vehicleData = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load vehicle data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              height: 490,
              width: 372,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(237, 238, 239, 1),
              ),
              child: vehicleData == null
                  ? const Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              vehicleData!['Modelo'],
                              style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w700),
                            ),
                          ),
                          SizedBox(height: 20),
                          _buildRow('Marca', vehicleData!['Marca']),
                          _buildRow('AnoModelo', vehicleData!['AnoModelo'].toString()),
                          _buildRow('Combustivel', vehicleData!['Combustivel']),
                          _buildRow('CodigoFipe', vehicleData!['CodigoFipe']),
                          _buildRow('MesReferencia', vehicleData!['MesReferencia']),
                          _buildRow('SiglaCombustivel', vehicleData!['SiglaCombustivel']),
                          _buildRow('Valor', vehicleData!['Valor']),
                          SizedBox(height: 20),
                          Center(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: const Color.fromRGBO(255, 92, 0, 1),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                                textStyle: const TextStyle(fontSize: 15),
                              ),
                              onPressed: () {
                                if (vehicleData != null) {
                                  final carro = Carro(
                                    modelo: vehicleData!['Modelo'],
                                    marca: vehicleData!['Marca'],
                                    anoModelo: vehicleData!['AnoModelo'].toString(),
                                    combustivel: vehicleData!['Combustivel'],
                                    mesReferencia: vehicleData!['MesReferencia'],
                                    valor: vehicleData!['Valor'],
                                    isExpanded: false,
                                  );
                                  FavoritesManager.adicionarFavorito(carro);
                                }
                              },
                              child: Text(
                                'Adicionar aos Favoritos',
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$label:',
            style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          Text(
            value,
            style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
