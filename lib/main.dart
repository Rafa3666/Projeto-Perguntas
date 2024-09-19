import 'package:flutter/material.dart'; // Importa os widgets e temas do Flutter.
//import 'question.dart'; // Novo componente criado para exibir a pergunta.
//import 'answer.dart'; // Componente para exibir as respostas.
import 'result.dart'; // Componente para mostrar o resultado final.
import 'questionnaire.dart'; // Componente para renderizar o questionário (perguntas e respostas).

// Função principal que inicializa o aplicativo.
void main() => runApp(
    const QuestionsApp()); // Inicia o app chamando o widget QuestionsApp.

class _QuestionsAppState extends State<QuestionsApp> {
  var _questionSelected =
      0; // Armazena o índice da pergunta atualmente selecionada.
  var _total = 0; // Armazena a pontuação total.

  // Lista de perguntas e respostas, usando um mapa para associar as perguntas às respostas.
  final List<Map<String, Object>> _questions = const [
    {
      "wording": "Quantas Champions tem CR7?", // Pergunta 1.
      "answer": [
        {"wording": "5 Títulos", "note": 5}, // Resposta correta com pontuação.
        {
          "wording": "3 Títulos",
          "note": 0
        }, // Respostas incorretas sem pontuação.
        {"wording": "8 Títulos", "note": 0},
        {"wording": "Nenhum Título", "note": 0},
      ],
    },
    {
      "wording": "Qual o recorde de Usain Bolt?", // Pergunta 2.
      "answer": [
        {"wording": "9.58 segundos", "note": 5}, // Resposta correta.
        {"wording": "8.47 segundos", "note": 0}, // Respostas incorretas.
        {"wording": "11.05 segundos", "note": 0},
        {"wording": "7.52 segundos", "note": 0},
      ],
    },
    {
      "wording": "O que é melhor?", // Pergunta 3.
      "answer": [
        {"wording": "Comer o Bolo", "note": 5}, // Resposta correta.
        {"wording": "Sentar no Bolo", "note": 0}, // Resposta incorreta.
      ],
    }
  ];

  // Função chamada quando o usuário responde a uma pergunta.
  void _answered(int note) {
    // Verifica se ainda há perguntas para serem respondidas.
    if (select) {
      // Atualiza o estado, avançando para a próxima pergunta e somando a pontuação.
      setState(() {
        _questionSelected++; // Passa para a próxima pergunta.
        _total += note; // Adiciona a pontuação da resposta.
      });
    }
  }

  // Função que reinicia o questionário, resetando o estado.
  void _restartQuestionnaire() {
    setState(() {
      _questionSelected = 0; // Reseta o índice das perguntas.
      _total = 0; // Reseta a pontuação total.
    });
  }

  // Getter que verifica se ainda há perguntas a serem respondidas.
  bool get select {
    return _questionSelected < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    // Retorna o MaterialApp que define o tema e a estrutura do aplicativo.
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          // Define o título da AppBar com estilo e cor.
          title: const Text(
            "Perguntas",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blue, // Define a cor de fundo da AppBar.
          centerTitle: true, // Centraliza o título na AppBar.
        ),
        // Verifica se ainda há perguntas, caso contrário, exibe o resultado.
        body: select
            ? Questionnaire(
                questions: _questions, // Passa a lista de perguntas.
                questionSelected: _questionSelected, // Passa a pergunta atual.
                answered: _answered, // Função para processar as respostas.
              )
            : Result(_total,
                _restartQuestionnaire), // Exibe o resultado final e reinicia o questionário.
      ),
    );
  }
}

// Define a classe principal do aplicativo (stateless).
class QuestionsApp extends StatefulWidget {
  const QuestionsApp({super.key});

  @override
  _QuestionsAppState createState() {
    return _QuestionsAppState(); // Cria e retorna o estado para o widget.
  }
}
