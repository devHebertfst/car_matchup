import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:car_matchup/Models/carro_selecionado.dart';
import 'package:car_matchup/Models/carro.dart';

class MyCarPage extends StatefulWidget {
  const MyCarPage({super.key});

  @override
  State<MyCarPage> createState() => _MyCarPageState();
}

class _MyCarPageState extends State<MyCarPage> {
  File? _image;
  DateTime? _nextOilChange;
  DateTime? _lastWorkshopVisit;
  bool permissionGranted = false;

  @override
  void initState() {
    super.initState();
    _carregarCarroSelecionado();
    _carregarImagem();
    _carregarDatas();
  }

  Future<void> _carregarCarroSelecionado() async {
    await CarroSelecionado.carregarCarroSelecionado();
    setState(() {});
  }

  Future<void> _carregarImagem() async {
    _image = await CarroSelecionado.carregarImagem();
    setState(() {});
  }

  Future<void> _carregarDatas() async {
    final datas = await CarroSelecionado.carregarDatas();
    setState(() {
      _nextOilChange = datas['proximaTrocaOleo'];
      _lastWorkshopVisit = datas['ultimaVisitaOficina'];
    });
  }

  Future<void> _getStoragePermission() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

    if (androidInfo.version.sdkInt < 33) {
      if (await Permission.storage.request().isGranted) {
        setState(() {
          permissionGranted = true;
        });
      } else if (await Permission.storage.isPermanentlyDenied) {
        await openAppSettings();
      } else if (await Permission.storage.isDenied) {
        setState(() {
          permissionGranted = false;
        });
      }
    } else {
      if (await Permission.photos.request().isGranted) {
        setState(() {
          permissionGranted = true;
        });
      } else if (await Permission.photos.isPermanentlyDenied) {
        await openAppSettings();
      } else if (await Permission.photos.isDenied) {
        setState(() {
          permissionGranted = false;
        });
      }
    }
  }

  Future<void> _pickImage() async {
    await _getStoragePermission();
    if (permissionGranted) {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
        await CarroSelecionado.salvarImagem(_image!);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Permissões necessárias não foram concedidas')),
      );
    }
  }

  Future<void> _selectDate(BuildContext context, DateTime? initialDate, Function(DateTime?) onDateSelected) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      onDateSelected(picked);
      await CarroSelecionado.salvarDatas(_nextOilChange, _lastWorkshopVisit);
    }
  }

  Future<void> _removerCarro() async {
    await CarroSelecionado.removerCarroSelecionado();
    setState(() {
      _image = null;
      _nextOilChange = null;
      _lastWorkshopVisit = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    Carro? carro = CarroSelecionado.carroSelecionado;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (carro == null)
                Text(
                  'Selecione um carro na tela de favoritos',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(fontSize: 18),
                )
              else ...[
                Text(
                  'Seu carro',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: 32,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    width: 300,
                    height: 200,
                    color: Colors.grey[300],
                    child: _image == null
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add, size: 50, color: Colors.grey),
                                Text(
                                  'Adicione uma foto',
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Image.file(_image!, fit: BoxFit.cover),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  carro.modelo,
                  style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 20),
                Text(
                  'Próxima troca de óleo',
                  style: GoogleFonts.poppins(fontSize: 16),
                ),
                SizedBox(height: 10),
                Container(
                  width: 300,
                  height: 64,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(255, 92, 0, 1),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      textStyle: const TextStyle(fontSize: 15),
                    ),
                    onPressed: () => _selectDate(context, _nextOilChange, (date) {
                      setState(() {
                        _nextOilChange = date;
                      });
                    }),
                    child: Text(
                      _nextOilChange == null
                          ? 'Selecionar data'
                          : 'Data: ${_nextOilChange!.day}/${_nextOilChange!.month}/${_nextOilChange!.year}',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Última ida à oficina',
                  style: GoogleFonts.poppins(fontSize: 16),
                ),
                SizedBox(height: 10),
                Container(
                  width: 300,
                  height: 64,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(255, 92, 0, 1),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      textStyle: const TextStyle(fontSize: 15),
                    ),
                    onPressed: () => _selectDate(context, _lastWorkshopVisit, (date) {
                      setState(() {
                        _lastWorkshopVisit = date;
                      });
                    }),
                    child: Text(
                      _lastWorkshopVisit == null
                          ? 'Selecionar data'
                          : 'Data: ${_lastWorkshopVisit!.day}/${_lastWorkshopVisit!.month}/${_lastWorkshopVisit!.year}',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Valor: ${carro.valor}',
                  style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () async {
                    await _removerCarro();
                  },
                  child: Text(
                    'Remover carro',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
