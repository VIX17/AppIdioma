import 'package:flutter/material.dart'; 
import 'tela_match.dart'; // Importa a tela TelaMatch.
import 'tela_ranking.dart'; // Importa a tela TelaRanking.

// Define a classe DrawerExample2 como um widget Stateless.
class DrawerExample2 extends StatelessWidget {
  const DrawerExample2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define o cabeçalho do drawer (menu lateral) com informações do usuário.
    final drawerHeader = const UserAccountsDrawerHeader(
      accountName: Text('User Name'), // Nome do usuário.
      accountEmail: Text('user.name@email.com'), // Email do usuário.
      currentAccountPicture: CircleAvatar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255), // Cor de fundo do avatar.
        child: FlutterLogo(size: 42.0), // Logo do Flutter no avatar.
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/capa.jpeg'), // Imagem de fundo do cabeçalho.
          fit: BoxFit.cover, // Cobre toda a área disponível.
        ),
      ),
    );

    // Itens do drawer (menu lateral), cada um representando uma página diferente.
    final drawerItems = ListView(
      children: <Widget>[
        drawerHeader, // Cabeçalho do drawer.
        ListTile(
          title: const Text('Seus Matches 👀', style: TextStyle(color: Colors.pink)), // Texto e estilo do item.
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const TelaMatch()), // Navega para a tela TelaMatch.
            );
          },
        ),
        ListTile(
          title: const Text('Ranking de Pontuações 👑', style: TextStyle(color: Colors.amber)), // Texto e estilo do item.
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const TelaRanking()), // Navega para a tela TelaRanking.
            );
          },
        ),
      ],
    );
    
    return drawerItems; // Retorna os itens do drawer.
  }
}
