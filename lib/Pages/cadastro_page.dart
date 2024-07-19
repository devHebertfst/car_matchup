import 'package:car_matchup/Pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _register() async {
  try {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    );

    // Atualize o perfil do usuário
    await userCredential.user?.updateDisplayName(_usernameController.text);
    await userCredential.user?.updatePhotoURL("default_image_url"); // Pode definir uma URL padrão ou carregar uma imagem

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Usuário registrado com sucesso!')),
    );

    // Navegar para a página de login após o cadastro bem-sucedido
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  } on FirebaseAuthException catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Erro: ${e.message}')),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 76,
                height: 76,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 92, 0, 1),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    'C',
                    style: GoogleFonts.poppins(
                      fontSize: 38,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Text(
                'Cadastro',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Ache o carro ideal para você',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 20),
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 64,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Center(
                    child: TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.person, color: Colors.grey),
                        hintText: 'Nome de usuário',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 64,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Center(
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.email_rounded, color: Colors.grey),
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 64,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Center(
                    child: TextFormField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.phone, color: Colors.grey),
                        hintText: 'Telefone',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 64,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Center(
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.lock, color: Colors.grey),
                        hintText: 'Senha',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 300,
                height: 64,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(255, 92, 0, 1),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    textStyle: const TextStyle(fontSize: 15),
                  ),
                  onPressed: _register,
                  child: Text(
                    'Cadastre-se',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Já tem uma conta?',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text(
                      'Login',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Color.fromRGBO(255, 92, 0, 1),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
