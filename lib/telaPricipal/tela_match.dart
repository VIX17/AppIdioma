import 'package:flutter/material.dart';
import 'telaconteudo1.dart';
import 'telaconteudo2.dart';
import 'telaconteudo3.dart';

class TelaMatch extends StatefulWidget {
  const TelaMatch({super.key});

  @override
  State<TelaMatch> createState() => _TelaMatchState();
}

class _TelaMatchState extends State<TelaMatch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seus Matches'),
      ),
      body: Container(      
        child: Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(elevation: 2),            
              onPressed: () {
                 Navigator.of(context).push(
               MaterialPageRoute(builder: (context) => Conteudopage1()));
              },
              child: Row(
                children: [
                  Image.asset('assets/images/baselvl1.png', height: 150, width: 150),
                  Text('    Conteudo iniciante', style: TextStyle(fontSize: 20, color: Colors.black), ),
                ],
              ),
            ),
            SizedBox(height: 10), // add some space between buttons
            ElevatedButton(
              style: ElevatedButton.styleFrom(elevation: 2),
              onPressed: () { 
                 Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Conteudopage2()));
              },
              child: Row(
                children: [
                  Image.asset('assets/images/baselvl2.png', height: 150, width: 150),
                  Text('    conteudo intermediario', style: TextStyle(fontSize: 20, color: Colors.black), ),
                ],
              ),
            ),
            SizedBox(height: 10), // add some space between buttons
            ElevatedButton(
              style: ElevatedButton.styleFrom(elevation: 2),
              onPressed: () {
               Navigator.of(context).push(
               MaterialPageRoute(builder: (context) => Conteudopage3()));
               },
              child: Row(
                children: [
                  Image.asset('assets/images/baselvl3.png', height: 150, width: 150),
                  Text('    conteudo avancado', style: TextStyle(fontSize: 20, color: Colors.black), ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}