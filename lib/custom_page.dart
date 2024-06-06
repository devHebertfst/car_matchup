import 'package:car_matchup/noticias_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'favoritos_page.dart';
import 'home_page.dart';
import 'myCar_page.dart';
import 'login_page.dart'; // Certifique-se de importar a página de login

class CustomPage extends StatefulWidget {
  const CustomPage({Key? key}) : super(key: key);

  @override
  State<CustomPage> createState() => CustomPageState();
}

class CustomPageState extends State<CustomPage> {
  int paginaAtual = 0;
  late PageController pc;
  File? _image;
  bool permissionGranted = false;

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: paginaAtual);
  }

  setPaginaAtual(pagina) {
    setState(() {
      paginaAtual = pagina;
    });
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _confirmSignOut() async {
    final shouldSignOut = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Sair da conta?',style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600)),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('Não',style: GoogleFonts.poppins(fontSize: 16,color: Color.fromRGBO(255, 92, 0, 1), fontWeight: FontWeight.w500)),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Sim',style: GoogleFonts.poppins(fontSize: 16,color: Color.fromRGBO(255, 92, 0, 1), fontWeight: FontWeight.w500)),
            ),
          ],
        );
      },
    );

    if (shouldSignOut == true) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text(
          'CarMatchup',
          style: GoogleFonts.poppins(
            color: Color.fromRGBO(255, 92, 0, 1),
            fontWeight: FontWeight.w600,
            fontSize: 24,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.newspaper_rounded),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NoticiasPage()),
              );
            },
          ),
          SizedBox(width: 10),
        ],
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(
          dividerTheme: DividerThemeData(color: Colors.transparent),
        ),
        child: Drawer(
          backgroundColor: Color.fromRGBO(255, 92, 0, 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  DrawerHeader(
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: _pickImage,
                          child: CircleAvatar(
                            radius: 55,
                            backgroundColor: Colors.white,
                            child: _image == null
                                ? Icon(Icons.add, size: 50, color: Colors.grey)
                                : CircleAvatar(
                                    radius: 50,
                                    backgroundImage: FileImage(_image!),
                                  ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Text(
                          'Fulano',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  ListTile(
                    leading: Icon(Icons.home, color: Colors.white),
                    title: Text(
                      'Home',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        paginaAtual = 0;
                        pc.jumpToPage(paginaAtual);
                      });
                      Navigator.pop(context);
                    },
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 1,
                    height: 10,
                    indent: 15,
                    endIndent: 15,
                  ),
                  ListTile(
                    leading: Icon(Icons.favorite, color: Colors.white),
                    title: Text(
                      'Favoritos',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        paginaAtual = 1;
                        pc.jumpToPage(paginaAtual);
                      });
                      Navigator.pop(context);
                    },
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 1,
                    height: 10,
                    indent: 15,
                    endIndent: 15,
                  ),
                  ListTile(
                    leading: const Icon(Icons.car_crash, color: Colors.white),
                    title: Text(
                      'Meu Carro',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        paginaAtual = 2;
                        pc.jumpToPage(paginaAtual);
                      });
                      Navigator.pop(context);
                    },
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 1,
                    height: 10,
                    indent: 15,
                    endIndent: 15,
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 30),
                  child: TextButton(
                    onPressed: _confirmSignOut,
                    child: Text(
                      'Sair',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        children: [
          HomePage(),
          FavoritosPage(),
          MyCarPage(),
        ],
        controller: pc,
        onPageChanged: setPaginaAtual,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Color.fromRGBO(255, 92, 0, 1),
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        currentIndex: paginaAtual,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favoritos'),
          BottomNavigationBarItem(icon: Icon(Icons.car_crash), label: 'Meu Carro'),
        ],
        onTap: (pagina) {
          pc.animateToPage(pagina, duration: const Duration(milliseconds: 400), curve: Curves.ease);
        },
      ),
    );
  }
}
