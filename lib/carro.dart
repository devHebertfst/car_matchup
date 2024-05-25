import 'dart:core';

class Carro{
  Carro({
    required this.marca,
    required this.modelo,
    required this.anoModelo,
    required this.combustivel,
    required this.mesReferencia,
    required this.valor,
    required this.isExpanded,
  });

  String marca;
  String modelo;
  String anoModelo;
  String combustivel;
  String mesReferencia;
  String valor;
  bool isExpanded = false;
}

class FavoritesManager {
  static List<Carro> _favoritos = [];

  static List<Carro> get favoritos => _favoritos;

  static void adicionarFavorito(Carro carro) {
    _favoritos.add(carro);
  }

  static void removerFavorito(Carro carro) {
    _favoritos.remove(carro);
  }
}