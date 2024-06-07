import 'package:flutter/material.dart';

// Um widget de botão personalizado que responde a eventos de toque
class MyTextButton extends StatelessWidget {
  // O rótulo de texto exibido no botão
  final String label;
  // A função de callback que é chamada quando o botão é tocado
  final VoidCallback onTap;

  // Construtor para inicializar o rótulo e a função de callback onTap
  const MyTextButton({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // A função onTap é chamada quando o botão é tocado
      onTap: onTap,
      child: Container(
        // Padding dentro do container para espaçamento
        padding: EdgeInsets.all(20),
        // Decoração do container incluindo cor de fundo e cantos arredondados
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
        // Widget Center para centralizar o rótulo de texto dentro do container
        child: Center(
          // O texto exibido no botão
          child: Text(
            label,
            // Estilo do texto: cor branca e tamanho da fonte 20
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}