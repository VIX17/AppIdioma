import 'package:app_idioma/widgets/my_input_field.dart';
import 'package:app_idioma/widgets/my_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SingUp extends StatefulWidget {
  @override
  _SingUpState createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

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
                      Icon(Icons.keyboard_arrow_left,
                          size: 48, color: Colors.white),
                      Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                      SizedBox(
                        width: 24,
                      )
                    ],
                  )),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 80),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(64)),
              ),
              child: SafeArea(
                top: false,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MyInputField(
                        label: 'Email',
                        placeholder: "Email Address",
                        onChange: (value) {
                          this.emailController.text = value;
                        },
                      ),
                      SizedBox(height: 30),
                      MyInputField(
                        label: 'Password',
                        placeholder: "Password",
                        onChange: (value) {
                          this.passwordController.text = value;
                        },
                        isPasswordField: true,
                      ),
                      SizedBox(height: 30),
                      MyTextButton(
                        label: "Log in",
                        onTap: () {
                          print(this.emailController.text +
                              " | " +
                              this.passwordController.text);
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            " Sign Up",
                            style: TextStyle(fontSize: 18),
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
