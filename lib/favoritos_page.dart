import 'package:car_matchup/carro.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritosPage extends StatefulWidget {
  const FavoritosPage({Key? key}) : super(key: key);

  @override
  State<FavoritosPage> createState() => _FavoritosPageState();
}

class _FavoritosPageState extends State<FavoritosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: FavoritesManager.favoritos.isEmpty
              ? Center(
                  child: Text(
                    'Nenhum carro favorito encontrado',
                    style: TextStyle(fontSize: 18),
                  ),
                )
              : ExpansionPanelList(
                  expandIconColor: Color.fromRGBO(255, 92, 0, 1),
                  expansionCallback: (int index, bool isExpanded) {
                    setState(() {
                      FavoritesManager.favoritos[index].isExpanded = isExpanded;
                    });
                  },
                  children: FavoritesManager.favoritos.map<ExpansionPanel>((Carro carro) {
                    return ExpansionPanel(
                      backgroundColor: Colors.white,
                      isExpanded: carro.isExpanded,
                      canTapOnHeader: false,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(
                          title: Text(
                            carro.modelo,
                            style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        );
                      },
                      body: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(237, 238, 239, 1),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildRow('Marca', carro.marca),
                            _buildRow('Ano Modelo', carro.anoModelo),
                            _buildRow('Combustível', carro.combustivel),
                            _buildRow('Mês Referência', carro.mesReferencia),
                            _buildRow('Valor', carro.valor),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    FavoritesManager.removerFavorito(carro);
                                    setState(() {});
                                  },
                                  icon: Icon(Icons.delete_forever, color: Color.fromRGBO(255, 92, 0, 1)),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.car_crash, color: Color.fromRGBO(255, 92, 0, 1)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
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
