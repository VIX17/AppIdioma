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
      body: Column(
        children: [
          // Container para a imagem de capa e logo
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .3,
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                image: AssetImage("assets/images/capa.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
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
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(64)),
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
                          MyTextButton(
                            label: "Log in",
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
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SingUp(),
                                ),
                              );
                            },
                            child: Text(
                              " Sign Up",
                              style: TextStyle(fontSize: 18),
                            ),
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
    );
  }
}
