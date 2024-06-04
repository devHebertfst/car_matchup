class CarModel {
  final int id;
  final String marca;
  final String modelo;
  final int ano;
  final String combustivel;
  final int lugares;
  final int portas;
  final String preco;
  final String categoria;
  final String configuracao;

  final List<String> imagens;

  CarModel({
    required this.id,
    required this.marca,
    required this.modelo,
    required this.ano,
    required this.combustivel,
    required this.configuracao,
    required this.lugares,
    required this.portas,
    required this.imagens,
    required this.preco,
    required this.categoria,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
  // Convertendo a lista de imagens do JSON para uma lista de strings
  List<String> imagens = [];
  if (json['imagens'] is List) {
    imagens = List<String>.from(json['imagens']);
  }

  return CarModel(
    id: json['id'],
    marca: json['marca'],
    modelo: json['modelo'],
    ano: json['ano'],
    combustivel: json['combustivel'],
    configuracao: json['configuracao'],
    lugares: json['lugares'],
    portas: json['portas'],
    preco: json['preco'],
    categoria: json['categoria'],
    imagens: imagens, // Usando a lista de imagens processada
  );
}

}
