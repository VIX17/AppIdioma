import 'package:flutter/material.dart';

class conteudopage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page3'),
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
