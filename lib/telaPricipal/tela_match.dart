import 'package:flutter/material.dart'; 
import 'telaconteudo1.dart'; // Importa a tela de conteúdo 1.
import 'telaconteudo2.dart'; // Importa a tela de conteúdo 2.
import 'telaconteudo3.dart'; // Importa a tela de conteúdo 3.

// Define a classe TelaMatch como um widget Stateful.
class TelaMatch extends StatefulWidget {
  const TelaMatch({super.key});

  @override
  State<TelaMatch> createState() => _TelaMatchState();
}

// Define o estado do widget TelaMatch.
class _TelaMatchState extends State<TelaMatch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seus Matches'), // Título da AppBar.
      ),
      body: Container(
        child: Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(elevation: 2), // Define a elevação do botão.
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Conteudopage1()), // Navega para a tela Conteudopage1.
                );
              },
              child: Row(
                children: [
                  Image.asset('assets/images/baselvl1.png', height: 150, width: 150), // Imagem do botão.
                  Text(
                    '    Conteudo iniciante',
                    style: TextStyle(fontSize: 20, color: Colors.black), // Estilo do texto do botão.
                  ),
                ],
              ),
            ),
            SizedBox(height: 10), // Adiciona um espaço entre os botões.
            ElevatedButton(
              style: ElevatedButton.styleFrom(elevation: 2), // Define a elevação do botão.
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Conteudopage2()), // Navega para a tela Conteudopage2.
                );
              },
              child: Row(
                children: [
                  Image.asset('assets/images/baselvl2.png', height: 150, width: 150), // Imagem do botão.
                  Text(
                    '    Conteudo intermediario',
                    style: TextStyle(fontSize: 20, color: Colors.black), // Estilo do texto do botão.
                  ),
                ],
              ),
            ),
            SizedBox(height: 10), // Adiciona um espaço entre os botões.
            ElevatedButton(
              style: ElevatedButton.styleFrom(elevation: 2), // Define a elevação do botão.
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Conteudopage3()), // Navega para a tela Conteudopage3.
                );
              },
              child: Row(
                children: [
                  Image.asset('assets/images/baselvl3.png', height: 150, width: 150), // Imagem do botão.
                  Text(
                    '    Conteudo avancado',
                    style: TextStyle(fontSize: 20, color: Colors.black), // Estilo do texto do botão.
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
