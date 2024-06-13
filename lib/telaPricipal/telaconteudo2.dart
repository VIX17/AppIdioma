import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:app_idioma/atividades/atividadelv2.dart';

class Conteudopage2 extends StatelessWidget {

  void _launchURL() async {
    const url = 'https://drive.google.com/drive/folders/12-hr9IU0FPnYR5V_9IU-rMjxaPnxaN4W?usp=drive_link';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {   
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Conteudo medio'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/telaconteudo2.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SizedBox(
            width: 250, // adjust the width as needed
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _launchURL();
                  },
                  child: Text('Tutoriais e Pdfs', style: TextStyle(color: Colors.black),),
                ),
                SizedBox(height: 20), // add some space between buttons
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) =>
                                 Quiz2()));
                  },
                  child: Text('Questionario', style: TextStyle(color: Colors.black),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}