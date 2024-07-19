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
  
  bool isEqual(Carro other) {
    return this.marca == other.marca &&
        this.modelo == other.modelo &&
        this.anoModelo == other.anoModelo &&
        this.combustivel == other.combustivel &&
        this.mesReferencia == other.mesReferencia &&
        this.valor == other.valor;
  }
}
