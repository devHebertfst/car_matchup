import 'package:car_matchup/cadastro_page.dart';
import 'package:car_matchup/custom_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              SizedBox(height: 100),
              Text(
                'Login',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Bem vindo ao CarMatchup',
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
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.person, color: Colors.grey),
                        hintText: 'Usuário',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20), // Espaço entre os campos de texto
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
              SizedBox(height: 40),
              Text(
                'Esqueceu a senha?',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CustomPage()),
                    );
                  },
                  child: Text(
                    'Login',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20), // Espaço entre o botão e o texto final
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Não tem uma conta?',
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
                        MaterialPageRoute(builder: (context) => CadastroPage()),
                      );
                    },
                    child: Text(
                      'Cadastre-se',
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
