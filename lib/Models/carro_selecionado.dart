import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:car_matchup/Models/carro.dart';

class CarroSelecionado {
  static Carro? carroSelecionado;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<void> selecionarCarro(Carro carro) async {
    User? user = _auth.currentUser;
    if (user != null) {
      carroSelecionado = carro;
      await _firestore.collection('usuarios').doc(user.uid).collection('carro_selecionado').doc('carro').set({
        'marca': carro.marca,
        'modelo': carro.modelo,
        'anoModelo': carro.anoModelo,
        'combustivel': carro.combustivel,
        'mesReferencia': carro.mesReferencia,
        'valor': carro.valor,
      });
    }
  }

  static Future<void> removerCarroSelecionado() async {
    User? user = _auth.currentUser;
    if (user != null) {
      carroSelecionado = null;
      await _firestore.collection('usuarios').doc(user.uid).collection('carro_selecionado').doc('carro').delete();
      await _removerImagem();
      await _removerDatas();
    }
  }

  static Future<void> carregarCarroSelecionado() async {
    User? user = _auth.currentUser;
    if (user != null) {
      final doc = await _firestore.collection('usuarios').doc(user.uid).collection('carro_selecionado').doc('carro').get();
      if (doc.exists) {
        carroSelecionado = Carro(
          marca: doc['marca'],
          modelo: doc['modelo'],
          anoModelo: doc['anoModelo'],
          combustivel: doc['combustivel'],
          mesReferencia: doc['mesReferencia'],
          valor: doc['valor'],
          isExpanded: false,
        );
      }
    }
  }

  static Future<void> salvarImagem(File imagem) async {
    User? user = _auth.currentUser;
    if (user != null) {
      final ref = _firestore.collection('usuarios').doc(user.uid).collection('carro_selecionado').doc('imagem');
      await ref.set({'path': imagem.path});
    }
  }

  static Future<File?> carregarImagem() async {
    User? user = _auth.currentUser;
    if (user != null) {
      final doc = await _firestore.collection('usuarios').doc(user.uid).collection('carro_selecionado').doc('imagem').get();
      if (doc.exists) {
        return File(doc['path']);
      }
    }
    return null;
  }

  static Future<void> _removerImagem() async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore.collection('usuarios').doc(user.uid).collection('carro_selecionado').doc('imagem').delete();
    }
  }

  static Future<void> salvarDatas(DateTime? proximaTrocaOleo, DateTime? ultimaVisitaOficina) async {
    User? user = _auth.currentUser;
    if (user != null) {
      final ref = _firestore.collection('usuarios').doc(user.uid).collection('carro_selecionado').doc('datas');
      await ref.set({
        'proximaTrocaOleo': proximaTrocaOleo?.millisecondsSinceEpoch,
        'ultimaVisitaOficina': ultimaVisitaOficina?.millisecondsSinceEpoch,
      });
    }
  }

  static Future<Map<String, DateTime?>> carregarDatas() async {
    User? user = _auth.currentUser;
    if (user != null) {
      final doc = await _firestore.collection('usuarios').doc(user.uid).collection('carro_selecionado').doc('datas').get();
      if (doc.exists) {
        return {
          'proximaTrocaOleo': doc['proximaTrocaOleo'] != null ? DateTime.fromMillisecondsSinceEpoch(doc['proximaTrocaOleo']) : null,
          'ultimaVisitaOficina': doc['ultimaVisitaOficina'] != null ? DateTime.fromMillisecondsSinceEpoch(doc['ultimaVisitaOficina']) : null,
        };
      }
    }
    return {'proximaTrocaOleo': null, 'ultimaVisitaOficina': null};
  }

  static Future<void> _removerDatas() async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore.collection('usuarios').doc(user.uid).collection('carro_selecionado').doc('datas').delete();
    }
  }
}
