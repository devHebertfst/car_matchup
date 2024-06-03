import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

class PessoaPage extends StatefulWidget {
  const PessoaPage({super.key});

  @override
  State<PessoaPage> createState() => _PessoaPageState();
}

class _PessoaPageState extends State<PessoaPage> {
  File? _image;
  DateTime? _nextOilChange;
  DateTime? _lastWorkshopVisit;
  bool permissionGranted = false;

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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: <Widget>[
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
                width: 200,
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
              'Próxima troca de óleo',
              style: GoogleFonts.poppins(fontSize: 16),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _selectDate(context, _nextOilChange, (date) {
                setState(() {
                  _nextOilChange = date;
                });
              }),
              child: Text(
                _nextOilChange == null
                    ? 'Selecionar data'
                    : 'Data: ${_nextOilChange!.day}/${_nextOilChange!.month}/${_nextOilChange!.year}',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Última ida à oficina',
              style: GoogleFonts.poppins(fontSize: 16),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _selectDate(context, _lastWorkshopVisit, (date) {
                setState(() {
                  _lastWorkshopVisit = date;
                });
              }),
              child: Text(
                _lastWorkshopVisit == null
                    ? 'Selecionar data'
                    : 'Data: ${_lastWorkshopVisit!.day}/${_lastWorkshopVisit!.month}/${_lastWorkshopVisit!.year}',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
