import 'package:flutter/material.dart';
import 'package:app_idioma/telaPricipal/telapricipal.dart';

class Quiz2 extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz2> {
  int perguntaNumero = 0;
  int acertos = 0;
  int erros = 0;

  final List<Map<String, dynamic>> quiz = [
    {
      "Pergunta": "Qual a cor de uma banana madura?",
      "respostas": ["Red", "Green", "Yellow", "Blue", "Purple"],
      "alternativa correta": 3,
    },
     {
      "Pergunta": "Qual desses objetos é tipicamente branco?",
      "respostas": ["Grass", "Snow", "Charcoal", "Sky", "Sunflower"],
      "alternativa correta": 2,
    },
     {
      "Pergunta": "De que cor é um caminhão de bombeiros tradicional?",
      "respostas": ["Blue", "Red", "Green", "Yellow", "Purple"],
      "alternativa correta": 2,
    },
     {
      "Pergunta": "Qual o nome da vaca em ingles?",
      "respostas": ["Cow ", "Chiken", "Buterfly", "Fish", "Cat"],
      "alternativa correta": 1,
    },
    {
      "Pergunta": "De que cor são a maioria das folhas das árvores?",
      "respostas": ["Brown", "Red", "Green", "Blue", "Black"],
      "alternativa correta": 3,
    },
    {
      "Pergunta": "Qual desses animais vive na agua?",
      "respostas": ["Cat", "Horse", "Bird", "Fish", "Lion"],
      "alternativa correta": 3,
    },
    // Adicione mais perguntas conforme necessário
  ];

  Color defaultButtonColor = Colors.blue; // Cor padrão dos botões
  List<Color> hoverColors = []; // Lista de cores dos botões ao passar o mouse

  @override
  void initState() {
    super.initState();
    // Inicializa a lista de cores com a cor padrão para cada botão
    quiz[perguntaNumero]['respostas'].forEach((_) {
      hoverColors.add(defaultButtonColor);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Atividade'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Implemente a navegação para a tela anterior aqui
          },
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Pergunta ${perguntaNumero + 1} de ${quiz.length}',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Center(
            child: Container(
              width: 600, // Ajuste a largura do container conforme necessário
              height: 700, // Ajuste a altura do container conforme necessário
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Pergunta:\n\n${quiz[perguntaNumero]['pergunta']}',
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  ...List<Widget>.generate(
                    quiz[perguntaNumero]['respostas'].length,
                    (index) => MouseRegion(
                      onEnter: (_) {
                        setState(() {
                          hoverColors[index] = Colors.green; // Define a cor ao passar o mouse
                        });
                      },
                      onExit: (_) {
                        setState(() {
                          hoverColors[index] = defaultButtonColor; // Retorna à cor padrão ao sair do botão
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 10), // Adiciona espaço entre os botões
                        child: ElevatedButton(
                          onPressed: () {
                            respondeu(index);
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 70), // Define a largura e altura do botão
                            padding: EdgeInsets.all(10),
                            backgroundColor: hoverColors[index], // Cor dinâmica ao passar o mouse
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              quiz[perguntaNumero]['respostas'][index],
                              style: TextStyle(fontSize: 20, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (perguntaNumero == quiz.length - 1) {
            // Se for a última pergunta, não faz nada
            return;
          }
          setState(() {
            perguntaNumero++;
          });
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }

  void respondeu(int respostaNumero) {
    setState(() {
      if (quiz[perguntaNumero]['alternativa correta'] == respostaNumero) {
        acertos++;
      } else {
        erros++;
      }

      if (perguntaNumero == quiz.length - 1) {
        // Se for a última pergunta, não faz nada
        return;
      }

      perguntaNumero++;
    });
  }
}
