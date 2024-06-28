import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Pages/result_page.dart';

class FipeForm extends StatefulWidget {
  final Function(String, String, String, String) onSubmit;

  const FipeForm({required this.onSubmit, Key? key}) : super(key: key);

  @override
  _FipeFormState createState() => _FipeFormState();
}

class _FipeFormState extends State<FipeForm> {
  String? selectedTipo;
  String? selectedMarca;
  String? selectedModelo;
  String? selectedAno;
  List<dynamic> marcas = [];
  List<dynamic> modelos = [];
  List<dynamic> anos = [];
  bool isMarcaDisabled = true;
  bool isModeloDisabled = true;
  bool isAnoDisabled = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Column(
        children: [
          DropdownButtonFormField<String>(
            isExpanded: true,
            decoration: InputDecoration(
              labelText: 'Tipo',
              labelStyle: GoogleFonts.poppins(
                color: const Color.fromRGBO(169, 169, 169, 1),
                fontWeight: FontWeight.w400,
              ),
            ),
            items: const [
              DropdownMenuItem(
                value: "carros",
                child: Text('Carro'),
              ),
              DropdownMenuItem(
                value: "motos",
                child: Text('Moto'),
              ),
              DropdownMenuItem(
                value: "caminhoes",
                child: Text('Caminhão'),
              ),
            ],
            onChanged: (String? veiculo) async {
              setState(() {
                selectedTipo = veiculo;
                isMarcaDisabled = veiculo == null;
                isModeloDisabled = true;
                isAnoDisabled = true;
                selectedMarca = null;
                selectedModelo = null;
                selectedAno = null;
                marcas = [];
                modelos = [];
                anos = [];
              });
              if (veiculo != null) {
                await fetchMarcas(veiculo);
              }
            },
            value: selectedTipo,
          ),
          const SizedBox(height: 20),
          DropdownButtonFormField<String>(
            isExpanded: true,
            decoration: InputDecoration(
              labelText: 'Marca',
              labelStyle: GoogleFonts.poppins(
                color: const Color.fromRGBO(169, 169, 169, 1),
                fontWeight: FontWeight.w400,
              ),
            ),
            items: isMarcaDisabled
                ? []
                : marcas.map<DropdownMenuItem<String>>((marca) {
                    return DropdownMenuItem<String>(
                      value: marca['codigo'].toString(),
                      child: Text(
                        marca['nome'],
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  }).toList(),
            onChanged: isMarcaDisabled
                ? null
                : (String? marca) async {
                    setState(() {
                      selectedMarca = marca;
                      isModeloDisabled = marca == null;
                      selectedModelo = null;
                      selectedAno = null;
                      isAnoDisabled = true;
                      modelos = [];
                      anos = [];
                    });
                    if (marca != null) {
                      await fetchModelos(selectedTipo!, marca);
                    }
                  },
            value: selectedMarca,
          ),
          const SizedBox(height: 20),
          DropdownButtonFormField<String>(
            isExpanded: true,
            decoration: InputDecoration(
              labelText: 'Modelo',
              labelStyle: GoogleFonts.poppins(
                color: const Color.fromRGBO(169, 169, 169, 1),
                fontWeight: FontWeight.w400,
              ),
            ),
            items: isModeloDisabled
                ? []
                : modelos.map<DropdownMenuItem<String>>((modelo) {
                    return DropdownMenuItem<String>(
                      value: modelo['codigo'].toString(),
                      child: Text(
                        modelo['nome'],
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  }).toList(),
            onChanged: isModeloDisabled
                ? null
                : (String? modelo) async {
                    setState(() {
                      selectedModelo = modelo;
                      isAnoDisabled = modelo == null;
                      selectedAno = null;
                    });
                    if (modelo != null) {
                      final anosList = await fetchAnos(selectedTipo!, selectedMarca!, modelo);
                      setState(() {
                        anos = anosList;
                        isAnoDisabled = false;
                      });
                    }
                  },
            value: selectedModelo,
          ),
          const SizedBox(height: 20),
          DropdownButtonFormField<String>(
            isExpanded: true,
            decoration: InputDecoration(
              labelText: 'Ano',
              labelStyle: GoogleFonts.poppins(
                color: const Color.fromRGBO(169, 169, 169, 1),
                fontWeight: FontWeight.w400,
              ),
            ),
            items: isAnoDisabled
                ? []
                : anos.map<DropdownMenuItem<String>>((ano) {
                    return DropdownMenuItem<String>(
                      value: ano['codigo'].toString(),
                      child: Text(
                        ano['nome'],
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  }).toList(),
            onChanged: isAnoDisabled
                ? null
                : (String? ano) {
                    setState(() {
                      selectedAno = ano;
                    });
                  },
            value: selectedAno,
          ),
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
            onPressed: () {
              if (selectedTipo != null && selectedMarca != null && selectedModelo != null && selectedAno != null) {
                widget.onSubmit(selectedTipo!, selectedMarca!, selectedModelo!, selectedAno!);
              }
            },
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
    );
  }

  Future<void> fetchMarcas(String tipo) async {
    final response = await http.get(Uri.parse('https://parallelum.com.br/fipe/api/v1/$tipo/marcas'));
    if (response.statusCode == 200) {
      setState(() {
        marcas = json.decode(response.body);
        isMarcaDisabled = false;
      });
    } else {
      throw Exception('Failed to load marcas');
    }
  }

  Future<List<dynamic>> fetchAnos(String tipo, String marca, String modelo) async {
    final response = await http.get(Uri.parse('https://parallelum.com.br/fipe/api/v1/$tipo/marcas/$marca/modelos/$modelo/anos'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load anos');
    }
  }

  Future<void> fetchModelos(String tipo, String marca) async {
    final response = await http.get(Uri.parse('https://parallelum.com.br/fipe/api/v1/$tipo/marcas/$marca/modelos'));
    if (response.statusCode == 200) {
      setState(() {
        modelos = json.decode(response.body)['modelos'];
        isModeloDisabled = false;
      });
    } else {
      throw Exception('Failed to load modelos');
    }
  }
}
