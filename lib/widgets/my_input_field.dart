import 'package:flutter/material.dart';

class MyInputField extends StatelessWidget {
  final bool isPasswordField; // Indica se o campo é uma senha
  final String label; // Rótulo do campo
  final String placeholder; // Placeholder do campo
  final Function
      onChange; // Função de callback chamada quando o valor do campo muda

  const MyInputField({
    Key? key,
    required this.placeholder,
    required this.label,
    this.isPasswordField = false, // Por padrão, o campo não é de senha
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20), // Define o padding do container
      decoration: BoxDecoration(
        color: Colors.white, // Cor de fundo do container
        borderRadius: BorderRadius.only(
          topLeft:
              Radius.circular(16), // Define o raio do canto superior esquerdo
          bottomLeft:
              Radius.circular(16), // Define o raio do canto inferior esquerdo
          bottomRight:
              Radius.circular(16), // Define o raio do canto inferior direito
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 32, // Define o raio do desfoque da sombra
            color: Colors.black
                .withOpacity(0.1), // Define a cor da sombra com opacidade
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment
            .start, // Alinha os filhos no início do eixo cruzado
        children: [
          Text(label), // Exibe o rótulo do campo
          TextField(
            obscureText:
                isPasswordField, // Se true, oculta o texto (campo de senha)
            onChanged: (value) {
              onChange(value); // Chama a função de callback com o novo valor
            },
            decoration: InputDecoration(
              hintText: placeholder, // Define o placeholder do campo
              border: InputBorder.none, // Remove a borda padrão do campo
            ),
          ),
        ],
      ),
    );
  }
}
