import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Quiz(),
    );
  }
}

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int perguntaNumero = 0;
  int acertos = 0;
  int erros = 0;
  String respostaUsuario = '';

  final List<Map<String, dynamic>> quiz = [
    {
      "pergunta": "1- Which form of the verb is correct in the simple present tense for the sentence \"He ___ to school every day\"?",
      "respostaCorreta": "goes",
      "alternativas": ["go", "goes", "going", "went", "gone"]
    },
    {
      "pergunta": "2- What is the simple past form of the verb \"to eat\"?",
      "respostaCorreta": "ate",
      "alternativas": ["eat", "eated", "eats", "eating", "ate"]
    },
    {
      "pergunta": "3- Which verb form correctly completes the sentence in the simple present: \"They ___ football on weekends\"?",
      "respostaCorreta": "play",
      "alternativas": ["playing", "played", "plays", "play", "plaied"]
    },
    {
      "pergunta": "4- What is the simple past form of the verb \"to go\"?",
      "respostaCorreta": "went",
      "alternativas": ["go", "gone", "went", "goes", "going"]
    },
    {
      "pergunta": "5- Which sentence is correct in the simple present tense?",
      "respostaCorreta": "He writes a letter.",
      "alternativas": ["She write a letter.", "He writes a letter.", "They writing a letter.", "We writed a letter.", "You writes a letter."]
    },
    {
      "pergunta": "6- What is the simple past form of the verb \"to see\"?",
      "respostaCorreta": "saw",
      "alternativas": ["see", "seen", "sees", "saw", "seeing"]
    },
    // Adicione mais perguntas conforme necessário
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz de Idiomas'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: BoxConstraints(
              minWidth: 300,
              maxWidth: 1100,
            ),
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Pergunta ${perguntaNumero + 1} de ${quiz.length}',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(height: 20),
                Card(
                  elevation: 5,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    constraints: BoxConstraints(
                      minWidth: 300,
                      maxWidth: 600,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Text(
                          '${quiz[perguntaNumero]['pergunta']}',
                          style: TextStyle(fontSize: 24),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        Column(
                          children: List<Widget>.generate(
                            quiz[perguntaNumero]['alternativas'].length,
                            (index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  respostaUsuario = quiz[perguntaNumero]['alternativas'][index];
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      respostaUsuario = quiz[perguntaNumero]['alternativas'][index];
                                    });
                                  },
                                  child: Text(
                                    quiz[perguntaNumero]['alternativas'][index],
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(
                                      respostaUsuario == quiz[perguntaNumero]['alternativas'][index]
                                          ? Colors.green // cor do botão selecionado
                                          : Colors.blue, // cor do botão não selecionado
                                    ),
                                    foregroundColor: MaterialStateProperty.all<Color>(
                                      respostaUsuario == quiz[perguntaNumero]['alternativas'][index]
                                          ? Colors.black // cor do texto do botão selecionado
                                          : Colors.white, // cor do texto do botão não selecionado
                                    ),
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
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (respostaUsuario == quiz[perguntaNumero]['respostaCorreta']) {
                        acertos++;
                      } else {
                        erros++;
                      }
                      if (perguntaNumero == quiz.length - 1) {
                        // Navega para a próxima tela
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProximaTela(acertos: acertos, erros: erros, totalPerguntas: quiz.length)),
                        );
                      } else {
                        // Vai para a próxima pergunta
                        perguntaNumero++;
                        respostaUsuario = ''; // Limpa a resposta do usuário
                      }
                    });
                  },
                  child: Text(
                    'Next',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(height: 20),
                // Container com acertos e erros
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 150,
                    maxWidth: 300,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Acertos: $acertos',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Text(
                        'Erros: $erros',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProximaTela extends StatelessWidget {
  final int acertos;
  final int erros;
  final int totalPerguntas;

  ProximaTela({required this.acertos, required this.erros, required this.totalPerguntas});

  @override
  Widget build(BuildContext context) {
    double porcentagemAcertos = (acertos / totalPerguntas) * 100;
    double porcentagemErros = (erros / totalPerguntas) * 100;

    return Scaffold(
      appBar: AppBar(
        title: Text('Ranking'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            constraints: BoxConstraints(
              minWidth: 300,
              maxWidth: 600,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Resultado',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 20),
                Text(
                  'Total de acertos: $acertos',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'Total de erros: $erros\n',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'Porcentagem de acertos: ${porcentagemAcertos.toStringAsFixed(2)}%',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'Porcentagem de erros: ${porcentagemErros.toStringAsFixed(2)}%',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()), // Substitua 'MyApp' pela tela desejada
                    );
                  },
                  child: Text(
                    'Voltar',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
