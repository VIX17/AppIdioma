import 'package:flutter/material.dart';
import 'package:app_idioma/views/singup.dart';
import 'package:app_idioma/widgets/my_input_field.dart';
import 'package:app_idioma/widgets/my_text_button.dart';


// Tela de login que é um StatefulWidget
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

// Estado associado à tela de login
class _LoginState extends State<Login> {
  // Controladores para os campos de email e senha
  late TextEditingController emailController;
  late TextEditingController passwordController;

  // Inicializa os controladores
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  // Libera os recursos dos controladores
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 0, 0, 0),
          image: DecorationImage(
            image: AssetImage("assets/images/capa.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            // Container para a imagem de capa e logo
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .3,
              child: Center(
                child: Image(
                  image: AssetImage("assets/images/log.png"),
                  width: 100,
                ),
              ),
            ),
            // Container para o formulário de login
            Expanded(
              child: Container(
                width: 500,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: SafeArea(
                  top: false,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Título da tela de login
                        Text(
                          "Login",
                          style: TextStyle(fontSize: 40),
                        ),
                        SizedBox(height: 20),
                        // Campos de entrada para email e senha
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            MyInputField(
                              label: 'Email',
                              placeholder: "Email Address",
                              onChange: (value) {
                                emailController.text = value;
                              },
                            ),
                            SizedBox(height: 30),
                            MyInputField(
                              label: 'Password',
                              placeholder: "Password",
                              onChange: (value) {
                                passwordController.text = value;
                              },
                              isPasswordField: true,
                            ),
                            SizedBox(height: 30),
                            // Botão de login
                            HoverMyTextButton(
                              label: "Login",
                              onTap: () {
                                print(emailController.text + " | " + passwordController.text);
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        // Texto para redirecionar para a tela de cadastro
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: TextStyle(fontSize: 18),
                            ),
                            SignUpTextButton(
                              label: " Sign Up",
                              onTap: () {
                                Navigator.push(context, 
                                MaterialPageRoute(
                                  builder: (context) => SignUp(),
                                ),
                                );
                                // Ação a ser realizada ao clicar em Sign Up
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Botão de texto personalizado para redirecionar para a tela de cadastro
class SignUpTextButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  SignUpTextButton({required this.label, required this.onTap});

  @override
  _SignUpTextButtonState createState() => _SignUpTextButtonState();
}

class _SignUpTextButtonState extends State<SignUpTextButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: Text(
          widget.label,
          style: TextStyle(
            fontSize: 18,
            color: isHovered ? Color.fromARGB(255, 0, 0, 0) : Color.fromARGB(255, 9, 87, 255),
          ),
        ),
      ),
    );
  }
}

// Botão personalizado que muda de cor quando o mouse está sobre ele
class HoverMyTextButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  HoverMyTextButton({required this.label, required this.onTap});

  @override
  _HoverMyTextButtonState createState() => _HoverMyTextButtonState();
}

class _HoverMyTextButtonState extends State<HoverMyTextButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          decoration: BoxDecoration(
            color: isHovered ? Color.fromARGB(255, 51, 51, 51) : Color.fromARGB(255, 9, 87, 255),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            widget.label,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
