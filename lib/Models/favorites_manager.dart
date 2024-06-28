import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:car_matchup/Models/carro.dart';

class FavoritesManager {
  static List<Carro> _favoritos = [];
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static List<Carro> get favoritos => _favoritos;

  static Future<void> carregarFavoritos() async {
    User? user = _auth.currentUser;
    if (user != null) {
      final snapshot = await _firestore.collection('usuarios').doc(user.uid).collection('favoritos').get();
      _favoritos = snapshot.docs.map((doc) => Carro(
        marca: doc['marca'],
        modelo: doc['modelo'],
        anoModelo: doc['anoModelo'],
        combustivel: doc['combustivel'],
        mesReferencia: doc['mesReferencia'],
        valor: doc['valor'],
        isExpanded: false,
      )).toList();
    }
  }

  static Future<bool> adicionarFavorito(Carro carro) async {
    User? user = _auth.currentUser;
    if (user != null && !_favoritos.any((favorito) => favorito.isEqual(carro))) {
      _favoritos.add(carro);
      await _firestore.collection('usuarios').doc(user.uid).collection('favoritos').add({
        'marca': carro.marca,
        'modelo': carro.modelo,
        'anoModelo': carro.anoModelo,
        'combustivel': carro.combustivel,
        'mesReferencia': carro.mesReferencia,
        'valor': carro.valor,
      });
      return true;
    }
    return false;
  }

  static Future<void> removerFavorito(Carro carro) async {
    User? user = _auth.currentUser;
    if (user != null) {
      final snapshot = await _firestore.collection('usuarios').doc(user.uid).collection('favoritos').where('modelo', isEqualTo: carro.modelo).get();
      for (var doc in snapshot.docs) {
        await doc.reference.delete();
      }
      _favoritos.removeWhere((favorito) => favorito.isEqual(carro));
    }
  }
}
