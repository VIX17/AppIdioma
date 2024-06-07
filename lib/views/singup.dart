import 'package:flutter/material.dart';
import 'package:app_idioma/views/login.dart';
import 'package:app_idioma/widgets/my_input_field.dart';
import 'package:app_idioma/widgets/my_text_button.dart';

class SingUp extends StatefulWidget {
  @override
  _SingUpState createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  late TextEditingController emailController; // Controlador para o campo de email
  late TextEditingController passwordController; // Controlador para o campo de senha
  late TextEditingController confirmPasswordController; // Controlador para o campo de confirmação de senha
  late TextEditingController firstNameController; // Controlador para o campo de primeiro nome
  late TextEditingController lastNameController; // Controlador para o campo de sobrenome

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController(); // Inicializa o controlador do email
    passwordController = TextEditingController(); // Inicializa o controlador da senha
    confirmPasswordController = TextEditingController(); // Inicializa o controlador de confirmação de senha
    firstNameController = TextEditingController(); // Inicializa o controlador do primeiro nome
    lastNameController = TextEditingController(); // Inicializa o controlador do sobrenome
  }

  @override
  void dispose() {
    emailController.dispose(); // Libera o controlador do email
    passwordController.dispose(); // Libera o controlador da senha
    confirmPasswordController.dispose(); // Libera o controlador de confirmação de senha
    firstNameController.dispose(); // Libera o controlador do primeiro nome
    lastNameController.dispose(); // Libera o controlador do sobrenome
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                image: AssetImage("assets/images/capa.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context); // Volta para a tela anterior
                      },
                      child: Icon(
                        Icons.keyboard_arrow_left,
                        size: 48,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    SizedBox(width: 24),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(64)),
              ),
              clipBehavior: Clip.antiAlias,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MyInputField(
                        label: 'First name',
                        placeholder: "First name",
                        onChange: (value) {
                          firstNameController.text = value; // Atualiza o controlador do primeiro nome
                        },
                      ),
                      SizedBox(height: 20),
                      MyInputField(
                        label: 'Last name',
                        placeholder: "Last name",
                        onChange: (value) {
                          lastNameController.text = value; // Atualiza o controlador do sobrenome
                        },
                      ),
                      SizedBox(height: 20),
                      MyInputField(
                        label: 'Email',
                        placeholder: "Email Address",
                        onChange: (value) {
                          emailController.text = value; // Atualiza o controlador do email
                        },
                      ),
                      SizedBox(height: 20),
                      MyInputField(
                        label: 'Password',
                        placeholder: "Password",
                        onChange: (value) {
                          passwordController.text = value; // Atualiza o controlador da senha
                        },
                        isPasswordField: true,
                      ),
                      SizedBox(height: 20),
                      MyInputField(
                        label: 'Confirm Password',
                        placeholder: "Password",
                        onChange: (value) {
                          confirmPasswordController.text = value; // Atualiza o controlador de confirmação de senha
                        },
                        isPasswordField: true,
                      ),
                      SizedBox(height: 20),
                      MyTextButton(
                        label: "Sign Up",
                        onTap: () {
                          print(firstNameController.text); // Imprime o primeiro nome
                          print(lastNameController.text); // Imprime o sobrenome
                          print(emailController.text); // Imprime o email
                          print(passwordController.text); // Imprime a senha
                          print(confirmPasswordController.text); // Imprime a confirmação de senha
                        },
                      ),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "You already have an account?",
                            style: TextStyle(fontSize: 18),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => Login()), // Navega para a tela de login
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
    );
  }
}
