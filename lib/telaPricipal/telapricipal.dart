import 'package:flutter/material.dart'; 
import 'drawer.dart'; // Importa o arquivo drawer.dart.
import 'telaconteudo1.dart'; // Importa o arquivo telaconteudo1.dart.
import 'telaconteudo2.dart'; // Importa o arquivo telaconteudo2.dart.
import 'telaconteudo3.dart'; // Importa o arquivo telaconteudo3.dart.

// Função principal que inicializa o aplicativo Flutter.
void main() {
  runApp(NavDrawerExample()); // Executa o aplicativo, iniciando o widget NavDrawerExample.
}

// Define a classe NavDrawerExample como um widget Stateful.
class NavDrawerExample extends StatefulWidget {
  const NavDrawerExample({Key? key}) : super(key: key); // Construtor com chave opcional.

  @override
  _NavDrawerExampleState createState() => _NavDrawerExampleState(); // Cria o estado do widget.
}

// Define o estado do widget NavDrawerExample.
class _NavDrawerExampleState extends State<NavDrawerExample> {
  // Lista de imagens.
  List<Foryou> imagens = [
    Foryou('assets/images/baselvl1.png'), // Imagem 1
    Foryou('assets/images/baselvl2.png'), // Imagem 2
    Foryou('assets/images/baselvl3.png'), // Imagem 3
  ];

  // Índice da imagem selecionada.
  int selectedImageIndex = 0;

  // Método para atualizar a imagem selecionada.
  void _updateSelectedImage() {
    setState(() {
      selectedImageIndex = (selectedImageIndex + 1) % imagens.length; // Atualiza o índice da imagem.
    });
  }

  // Método para pular a imagem atual.
  void _skip() {
    setState(() {
      selectedImageIndex = (selectedImageIndex + 1) % imagens.length; // Atualiza o índice da imagem.
    });
  }

  // Método build que descreve como construir a interface do usuário deste widget.
  @override
  Widget build(BuildContext context) {
    // Retorna um MaterialApp, que é o widget raiz do aplicativo.
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Desativa o banner de debug.
      home: Scaffold(
        extendBodyBehindAppBar: true, // Estende o corpo do Scaffold atrás da AppBar.
        appBar: AppBar(
          backgroundColor: Colors.transparent, // Torna a AppBar transparente.
          elevation: 0.0, // Remove a sombra da AppBar.
        ),
        body: Column(
          children: [
            // Fundo com um gradiente.
            Expanded(
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/capa.jpeg', // Imagem de fundo.
                        ),
                        fit: BoxFit.cover, // Cobre toda a área disponível.
                      ),
                    ),
                  ),
                  // Caixa central semi-opaca que exibe a imagem selecionada.
                  Center(
                    child: Container(
                      width: 450, // Largura da caixa.
                      height: 570, // Altura da caixa.
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7), // 70% opaco.
                        borderRadius: BorderRadius.circular(14), // Bordas arredondadas.
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0), // Espaçamento interno.
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center, // Alinhamento central.
                            children: [
                              Image.asset(
                                imagens[selectedImageIndex].imagePath, // Exibe a imagem selecionada.
                                fit: BoxFit.contain,
                                width: 400, // Define a largura da imagem.
                                height: 400, // Define a altura da imagem.
                              ),
                              const SizedBox(height: 16.0), // Espaçamento entre a imagem e os botões.
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center, // Alinha os botões no centro.
                                children: [
                                  SizedBox(
                                    // Altura personalizada do botão.
                                    child: ElevatedButton(
                                      onPressed: _skip, // Chama o método _skip ao pressionar.
                                      child: const Text('Pular assunto',
                                          style: TextStyle(
                                              color: Color.fromARGB(255, 0, 0, 0))), // Texto do botão.
                                    ),
                                  ),
                                  const SizedBox(width: 100.0), // Espaçamento entre os botões.
                                  Builder(
                                    builder: (context) {
                                      return ElevatedButton(
                                        onPressed: () {
                                          // Navega para diferentes telas com base no índice da imagem selecionada.
                                          switch (selectedImageIndex) {
                                            case 0:
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(builder: (context) => Conteudopage1()));
                                              break;
                                            case 1:
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) => Conteudopage2()));
                                              break;
                                            case 2:
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) => Conteudopage3()));
                                              break;
                                            default:
                                              // Caso padrão, se necessário.
                                              break;
                                          }
                                        },
                                        child: const Text('Desbloquear assunto',
                                            style: TextStyle(
                                                color: Color.fromARGB(255, 0, 0, 0))), // Texto do botão.
                                      );
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
          ],
        ),
        // Drawer (menu lateral) contendo os itens definidos anteriormente.
        drawer: const Drawer(
          child: DrawerExample2(), // Conteúdo do menu lateral.
        ),
      ),
    );
  }
}

// Classe simples que representa uma imagem.
class Foryou {
  final String imagePath; // Caminho da imagem.
  Foryou(this.imagePath); // Construtor.
}
