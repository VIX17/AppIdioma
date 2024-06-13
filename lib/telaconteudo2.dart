import 'package:flutter/material.dart';

class conteudopage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page2'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
           // Navigator.push(
            //  context,
            //  MaterialPageRoute(builder: (context) {},),
           // );
          },
          child: Text('Tutoriais'),
        ),
      ),
    );
  }
}
