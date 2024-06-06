class Carro {
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

  // Método para comparar carros
  bool isEqual(Carro other) {
    return this.marca == other.marca &&
        this.modelo == other.modelo &&
        this.anoModelo == other.anoModelo &&
        this.combustivel == other.combustivel &&
        this.mesReferencia == other.mesReferencia &&
        this.valor == other.valor;
  }
}

class FavoritesManager {
  static List<Carro> _favoritos = [];

  static List<Carro> get favoritos => _favoritos;

  static bool adicionarFavorito(Carro carro) {
    if (!_favoritos.any((favorito) => favorito.isEqual(carro))) {
      _favoritos.add(carro);
      return true;
    }
    return false;
  }

  static void removerFavorito(Carro carro) {
    _favoritos.removeWhere((favorito) => favorito.isEqual(carro));
  }
}