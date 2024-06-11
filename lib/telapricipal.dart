import 'package:flutter/material.dart';
import 'tela_match.dart';

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
    Foryou('assets/images/imat.jpeg'),
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
    // Cabeçalho do drawer, exibindo informações do usuário.
    final drawerHeader = const UserAccountsDrawerHeader(
      accountName: Text('User Name'),
      accountEmail: Text('user.name@email.com'),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.white,
        child: FlutterLogo(size: 42.0),
      ),
    );

    // Itens do drawer (menu lateral), cada um representando uma página diferente.
    final drawerItems = ListView(
      children: <Widget>[
        drawerHeader,
        ListTile(
          title: const Text('Seus Matches 👀', style: TextStyle(color: Colors.pink)),
          onTap: () {
            Navigator.push(context, 
               MaterialPageRoute(builder: (context) => TelaMatch()));
          } 
        ),
        ListTile(
          title: const Text('Ranking de Pontuações 👑', style: TextStyle(color: Colors.amber)),
          onTap: () => Navigator.of(context).push(_NewPage(2)), // Navega para a nova página com ID 2.
        ),
        ListTile(
          title: const Text('Respondidas ', style: TextStyle(color: Colors.red)),
          onTap: () => Navigator.of(context).push(_NewPage(3)), // Navega para a nova página com ID 3.
        ),
      ],
    );

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
                      width: 400,
                      height: 540,
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
                                width: 300, // Define a largura da imagem.
                                height: 400, // Define a altura da imagem.
                              ),
                              const SizedBox(height: 16.0), // Espaçamento entre a imagem e os botões.
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 60, // Largura personalizada do botão.
                                    height: 50, // Altura personalizada do botão.
                                    child: ElevatedButton(
                                      onPressed: _skip,
                                      child: const Text('X', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                                      
                                    ),
                                  ),
                                  const SizedBox(width: 100.0), // Espaçamento entre os botões.
                                  SizedBox(
                                    width: 60, // Largura personalizada do botão.
                                    height: 50, // Altura personalizada do botão.
                                    child: ElevatedButton(
                                      onPressed: _updateSelectedImage,
                                      child: const Text('V'),
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
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: drawerItems,
        ),
      ),
    );
  }
}

// Classe _NewPage que cria uma nova rota/página no aplicativo.
// <void> significa que esta rota não retorna nada.
class _NewPage extends MaterialPageRoute<void> {
  // Construtor que inicializa a rota com um ID.
  _NewPage(int id)
      : super(
          builder: (BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Page $id'),
                elevation: 1.0,
              ),
              body: Center(
                child: Text('Page $id'),
              ),
            );
          },
        );
}

// Classe simples que representa uma imagem.
class Foryou {
  final String imagePath;
  Foryou(this.imagePath);
}
