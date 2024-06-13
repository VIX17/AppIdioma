import 'package:flutter/material.dart';
import 'tela_match.dart';
import 'tela_ranking.dart';

class DrawerExample2 extends StatelessWidget {
  const DrawerExample2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final drawerHeader = const UserAccountsDrawerHeader(
      accountName: Text('User Name'),
      accountEmail: Text('user.name@email.com'),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        child: FlutterLogo(size: 42.0),
      ),
     decoration:  BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              'assets/images/capa.jpeg',
            ),
            fit: BoxFit.cover,
                      ),
      )
    );
   
    // Itens do drawer (menu lateral), cada um representando uma página diferente.
    final drawerItems = ListView(
      children: <Widget>[
        drawerHeader,
        ListTile(
          title: const Text('Seus Matches 👀', style: TextStyle(color: Colors.pink)),
          onTap: () {
            Navigator.of(context).push(
               MaterialPageRoute(builder: (context) => const TelaMatch()));
          } 
        ),
        ListTile(
          title: const Text('Ranking de Pontuações 👑', style: TextStyle(color: Colors.amber)),
           onTap: () {
            Navigator.of(context).push(
               MaterialPageRoute(builder: (context) => const TelaRanking()));
          } 
        ),
      ],
    );
    return drawerItems;
  }
}