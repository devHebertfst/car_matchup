import 'package:flutter/material.dart';
import 'package:car_matchup/car_modelo.dart';

class CarTile extends StatelessWidget {
  final CarModel car;

  const CarTile({required this.car});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(10.0),
          height: 160,
          width: 240, // Definindo um tamanho fixo para o contêiner
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  car.imagem,
                  fit: BoxFit.cover,
                  width: double.infinity, // Garantindo que a imagem ocupe todo o espaço disponível no contêiner
                  height: double.infinity, // Garantindo que a imagem ocupe todo o espaço disponível no contêiner
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                    ),
                  ),
                  child: Text(
                    'Recomendado',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
