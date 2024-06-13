import 'package:flutter/material.dart'; 
import 'package:url_launcher/url_launcher.dart';
import 'package:app_idioma/atividades/atividadelv3.dart'; 


class Conteudopage3 extends StatelessWidget {

  // Método para lançar uma URL.
  void _launchURL() async {
    const url = 'https://drive.google.com/drive/folders/1-MpBEUWdEbwxNa9axiRBpI2h9wXp0hhI?usp=drive_link'; // URL a ser aberta.
    if (await canLaunch(url)) { // Verifica se a URL pode ser lançada.
      await launch(url); // Lança a URL.
    } else {
      throw 'Could not launch $url'; // Lança uma exceção se a URL não puder ser aberta.
    }
  }

  @override
  Widget build(BuildContext context) {   
    return Scaffold(
      extendBodyBehindAppBar: true, // Estende o corpo do Scaffold atrás da AppBar.
      appBar: AppBar(
        title: Text('Conteudo intermediario'), // Título da AppBar.
        centerTitle: true, // Centraliza o título.
        backgroundColor: Colors.transparent, // Torna a AppBar transparente.
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/telaconteudo3.png'), // Imagem de fundo.
            fit: BoxFit.cover, // Cobre toda a área disponível.
          ),
        ),
        child: Center(
          child: SizedBox(
            width: 250, // Define a largura do Container.
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Alinha os filhos no centro.
              children: [
                ElevatedButton(
                  onPressed: () {
                    _launchURL(); // Chama o método _launchURL ao pressionar o botão.
                  },
                  child: Text('Tutoriais e Pdfs', style: TextStyle(color: Colors.black)), // Texto do botão.
                ),
                SizedBox(height: 20), // Adiciona um espaço entre os botões.
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Quiz3(), // Navega para a tela Quiz3.
                      ),
                    );
                  },
                  child: Text('Questionario', style: TextStyle(color: Colors.black)), // Texto do botão.
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
