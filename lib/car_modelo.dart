class CarModel {
  final int id;
  final String marca;
  final String modelo;
  final int ano;
  final String combustivel;
  final int lugares;
  final int portas;
  final String configuracao;

  final String imagem;

  CarModel({
    required this.id,
    required this.marca,
    required this.modelo,
    required this.ano,
    required this.combustivel,
    required this.configuracao,
    required this.lugares,
    required this.portas,
    required this.imagem,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['id'],
      marca: json['marca'],
      modelo: json['modelo'],
      ano: json['ano'],
      combustivel: json['combustivel'],
      configuracao: json['configuracao'],
      lugares: json['lugares'],
      portas: json['portas'],
      imagem: json['imagem'],
    );
  }
}
