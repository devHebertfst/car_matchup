import 'package:flutter/material.dart';
import 'package:car_matchup/car_modelo.dart';
import 'package:google_fonts/google_fonts.dart';
import 'video_page.dart';

class CarDetailPage extends StatefulWidget {
  final CarModel car;

  const CarDetailPage({required this.car});

  @override
  _CarDetailPageState createState() => _CarDetailPageState();
}

class _CarDetailPageState extends State<CarDetailPage> {
  late String _currentImage;

  @override
  void initState() {
    super.initState();
    _currentImage = widget.car.imagens.first;
  }

  void _updateImage(String newImage) {
    setState(() {
      _currentImage = newImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle titleStyle = GoogleFonts.poppins(
      fontWeight: FontWeight.w700,
      fontSize: 19,
    );

    final TextStyle subtitleStyle = GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      fontSize: 15,
      color: Colors.grey,
    );

    final TextStyle labelStyle = GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      fontSize: 16,
    );

    final TextStyle valueStyle = GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      fontSize: 16,
    );

    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  height: 250,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.network(
                      _currentImage,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 25.0,
                  left: 16.0,
                  right: 16.0,
                  child: Container(
                    height: 60,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: widget.car.imagens.map((image) {
                        bool isSelected = _currentImage == image;
                        return GestureDetector(
                          onTap: () => _updateImage(image),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: isSelected ? Color.fromRGBO(255, 92, 0, 1) : Colors.transparent,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6.0),
                              child: Image.network(image, width: 100, height: 60, fit: BoxFit.cover),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: [
                    Text(
                      widget.car.modelo,
                      style: titleStyle,
                    ),
                    Text(
                      '${widget.car.preco} BRL',
                      style: subtitleStyle,
                    ),
                    SizedBox(height: 16),
                    _buildRow('Ano', '${widget.car.ano}', labelStyle, valueStyle),
                    _buildRow('Combustível', widget.car.combustivel, labelStyle, valueStyle),
                    _buildRow('Configuração', widget.car.configuracao, labelStyle, valueStyle),
                    _buildRow('Lugares', '${widget.car.lugares}', labelStyle, valueStyle),
                    _buildRow('Portas', '${widget.car.portas}', labelStyle, valueStyle),
                    SizedBox(height: 16),
                    Container(
                      height: 70,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(255, 92, 0, 1), // Background color
                          foregroundColor: Colors.white, // Text color
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VideoPage(videoUrl: widget.car.video),
                            ),
                          );
                        },
                        child: Text(
                          'Ver Vídeo',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value, TextStyle labelStyle, TextStyle valueStyle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$label:',
            style: labelStyle,
          ),
          Text(
            value,
            style: valueStyle,
          ),
        ],
      ),
    );
  }
}
