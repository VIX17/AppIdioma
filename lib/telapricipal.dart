import 'package:flutter/material.dart';
import 'drawer.dart';

// Função principal que inicializa o aplicativo Flutter.
void main() {
  runApp(NavDrawerExample());
}

// Define a classe NavDrawerExample como um widget Stateful.
class NavDrawerExample extends StatefulWidget {
  const NavDrawerExample({Key? key}) : super(key: key);

  @override
  _NavDrawerExampleState createState() => _NavDrawerExampleState();
}

// Define o estado do widget NavDrawerExample.
class _NavDrawerExampleState extends State<NavDrawerExample> {
  // Lista de imagens.
  List<Foryou> imagens = [
    Foryou('assets/images/bmw.jpg'),
    Foryou('assets/images/base.jpg'),
  ];

  // Índice da imagem selecionada.
  int selectedImageIndex = 0;

  // Método para atualizar a imagem selecionada.
  void _updateSelectedImage() {
    setState(() {
      selectedImageIndex = (selectedImageIndex + 1) % imagens.length;

    });
  }
    void _skip() {
    setState(() {
      selectedImageIndex = (selectedImageIndex + 1) % imagens.length;
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
              'assets/images/capa.jpeg',
            ),
            fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Caixa central semi-opaca que exibe a imagem selecionada.
                  Center(
                    child: Container(
                      width: 450,
                      height: 570,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7), // 50% opaco.
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                imagens[selectedImageIndex].imagePath,
                                fit: BoxFit.contain,
                                width: 400, // Define a largura da imagem.
                                height: 400, // Define a altura da imagem.
                              ),
                              
                              const SizedBox(height: 16.0), // Espaçamento entre a imagem e os botões.
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                   // Altura personalizada do botão.
                                    child: ElevatedButton(
                                      onPressed: _skip,
                                      child: const Text('Pular assunto', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                                      
                                    ),
                                  ),
                                  const SizedBox(width: 100.0), // Espaçamento entre os botões.
                                  SizedBox(
                                    // Altura personalizada do botão.
                                    child: ElevatedButton(
                                      onPressed: _updateSelectedImage,
                                      child: const Text('Desbloquear assunto', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
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
          ],
        ),
        // Drawer (menu lateral) contendo os itens definidos anteriormente.
        drawer:const Drawer(       
          child: DrawerExample2(),       
        ),
      ),
    );
  }
}
// Classe simples que representa uma imagem.
class Foryou {
  final String imagePath;
  Foryou(this.imagePath);
}
