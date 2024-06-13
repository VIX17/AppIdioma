import 'package:flutter/material.dart';
import 'package:app_idioma/telaPricipal/telapricipal.dart';

class Quiz1 extends StatefulWidget {
  @override
  _Quiz1State createState() => _Quiz1State();
}

class _Quiz1State extends State<Quiz1> {
  int perguntaNumero = 0;
  int acertos = 0;
  int erros = 0;
  String respostaUsuario = '';

  final List<Map<String, dynamic>> quiz = [
    {
      "Pergunta": "Qual a cor de uma banana madura?",
      "respostas": ["Red", "Green", "Yellow", "Blue", "Purple"],
      "alternativaCorreta": 2,
    },
    {
      "Pergunta": "Qual desses objetos é tipicamente branco?",
      "respostas": ["Grass", "Snow", "Charcoal", "Sky", "Sunflower"],
      "alternativaCorreta": 1,
    },
    {
      "Pergunta": "De que cor é um caminhão de bombeiros tradicional?",
      "respostas": ["Blue", "Red", "Green", "Yellow", "Purple"],
      "alternativaCorreta": 1,
    },
    {
      "Pergunta": "Qual o nome da vaca em inglês?",
      "respostas": ["Cow", "Chicken", "Butterfly", "Fish", "Cat"],
      "alternativaCorreta": 0,
    },
    {
      "Pergunta": "De que cor são a maioria das folhas das árvores?",
      "respostas": ["Brown", "Red", "Green", "Blue", "Black"],
      "alternativaCorreta": 2,
    },
    {
      "Pergunta": "Qual desses animais vive na água?",
      "respostas": ["Cat", "Horse", "Bird", "Fish", "Lion"],
      "alternativaCorreta": 3,
    },
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
                          '${quiz[perguntaNumero]['Pergunta']}',
                          style: TextStyle(fontSize: 24),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        Column(
                          children: List<Widget>.generate(
                            quiz[perguntaNumero]['respostas'].length,
                            (index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  respostaUsuario = quiz[perguntaNumero]['respostas'][index];
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      respostaUsuario = quiz[perguntaNumero]['respostas'][index];
                                    });
                                  },
                                  child: Text(
                                    quiz[perguntaNumero]['respostas'][index],
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(
                                      respostaUsuario == quiz[perguntaNumero]['respostas'][index]
                                          ? Colors.green // cor do botão selecionado
                                          : Colors.blue, // cor do botão não selecionado
                                    ),
                                    foregroundColor: MaterialStateProperty.all<Color>(
                                      respostaUsuario == quiz[perguntaNumero]['respostas'][index]
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
                      if (quiz[perguntaNumero]['respostas'].indexOf(respostaUsuario) == quiz[perguntaNumero]['alternativaCorreta']) {
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
                      MaterialPageRoute(builder: (context) => NavDrawerExample()), // Substitua 'NavDrawerExample' pela tela desejada
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
