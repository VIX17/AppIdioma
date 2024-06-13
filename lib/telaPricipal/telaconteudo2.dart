import 'package:flutter/material.dart'; 
import 'package:url_launcher/url_launcher.dart'; // Importa o pacote url_launcher para abrir URLs.
import 'package:app_idioma/atividades/atividadelv2.dart'; // Importa o arquivo atividadelv2.dart do pacote app_idioma.

// Define a classe Conteudopage2 como um widget Stateless.
class Conteudopage2 extends StatelessWidget {

  // Método para lançar uma URL.
  void _launchURL() async {
    const url = 'https://drive.google.com/drive/folders/12-hr9IU0FPnYR5V_9IU-rMjxaPnxaN4W?usp=drive_link'; // URL a ser aberta.
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
        title: Text('Conteudo medio'), // Título da AppBar.
        centerTitle: true, // Centraliza o título.
        backgroundColor: Colors.transparent, // Torna a AppBar transparente.
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/telaconteudo2.png'), // Imagem de fundo.
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
                        builder: (context) => Quiz2(), // Navega para a tela Quiz2.
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
