import 'package:flutter/material.dart';
import 'package:app_idioma/views/login.dart'; // Importa a tela de login
import 'package:app_idioma/widgets/my_input_field.dart';
import 'package:app_idioma/widgets/my_text_button.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;

  @override
  void initState() {
    super.initState();
    // Inicializa os controladores de texto
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
  }

  @override
  void dispose() {
    // Libera os controladores de texto
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
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
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Ícone para voltar à tela anterior
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.keyboard_arrow_left,
                        size: 48,
                        color: Colors.white,
                      ),
                    ),
                    // Título da tela de cadastro
                    Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    SizedBox(width: 24),
                  ],
                ),
              ),
              // Container para o formulário de cadastro
              Expanded(
                child: Container(
                  width: 500,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(30), // Espaçamento interno do container
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Campo de entrada para o primeiro nome
                          MyInputField(
                            label: 'First name',
                            placeholder: "First name",
                            onChange: (value) {
                              firstNameController.text = value;
                            },
                          ),
                          SizedBox(height: 20),
                          // Campo de entrada para o sobrenome
                          MyInputField(
                            label: 'Last name',
                            placeholder: "Last name",
                            onChange: (value) {
                              lastNameController.text = value;
                            },
                          ),
                          SizedBox(height: 20),
                          // Campo de entrada para o email
                          MyInputField(
                            label: 'Email',
                            placeholder: "Email Address",
                            onChange: (value) {
                              emailController.text = value;
                            },
                          ),
                          SizedBox(height: 20),
                          // Campo de entrada para a senha
                          MyInputField(
                            label: 'Password',
                            placeholder: "Password",
                            onChange: (value) {
                              passwordController.text = value;
                            },
                            isPasswordField: true,
                          ),
                          SizedBox(height: 20),
                          // Campo de entrada para a confirmação de senha
                          MyInputField(
                            label: 'Confirm Password',
                            placeholder: "Password",
                            onChange: (value) {
                              confirmPasswordController.text = value;
                            },
                            isPasswordField: true,
                          ),
                          SizedBox(height: 20),
                          // Botão de cadastro
                          HoverMyTextButton(
                            label: "Sign Up",
                            onTap: () {
                              // Imprime os valores dos campos de entrada
                              print(firstNameController.text);
                              print(lastNameController.text);
                              print(emailController.text);
                              print(passwordController.text);
                              print(confirmPasswordController.text);
                            },
                          ),
                          SizedBox(height: 40),
                          // Texto para redirecionar para a tela de login
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "You already have an account?",
                                style: TextStyle(fontSize: 18),
                              ),
                              // Botão para ir para a tela de login
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(builder: (context) => Login()),
                                    (route) => false,
                                  );
                                },
                                child: Text(
                                  " Log In",
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
        ),
      ),
    );
  }
}
