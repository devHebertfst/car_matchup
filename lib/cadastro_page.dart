import 'package:car_matchup/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
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
                  onPressed: () {},
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
