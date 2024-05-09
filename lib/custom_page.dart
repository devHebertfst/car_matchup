import 'package:car_matchup/noticias_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'favoritos_page.dart';
import 'home_page.dart';
import 'pessoa_page.dart';

class CustomPage extends StatefulWidget {
  const CustomPage({Key? key}) : super(key: key);

  @override
  State<CustomPage> createState() => CustomPageState();
}

class CustomPageState extends State<CustomPage> {
  int paginaAtual = 0;
  late PageController pc;

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
                MaterialPageRoute(builder: (context) => NoticiasPage()), // Substitua 'NoticiasPage()' pelo nome da sua página de notícias
              );
            },
          ),
          SizedBox(width: 20),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
              color: Color.fromRGBO(255, 92, 0, 1),
              ),
              child: Text(
                'Menu',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Cotação'),
              onTap: () {
                setState(() {
                  paginaAtual = 0;
                  pc.jumpToPage(paginaAtual);
                });
                Navigator.pop(context); // Fecha o Drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Bitcoins'),
              onTap: () {
                setState(() {
                  paginaAtual = 1;
                  pc.jumpToPage(paginaAtual);
                });
                Navigator.pop(context); // Fecha o Drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.car_crash),
              title: const Text('Ações'),
              onTap: () {
                setState(() {
                  paginaAtual = 2;
                  pc.jumpToPage(paginaAtual);
                });
                Navigator.pop(context); // Fecha o Drawer
              },
            ),
          ],
        ),
      ),
      body: PageView(
        children: [
          HomePage(),
          FavoritosPage(),
          PessoaPage(),
        ],
        controller: pc,
        onPageChanged: setPaginaAtual,
      ),
      bottomNavigationBar: BottomNavigationBar(
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
