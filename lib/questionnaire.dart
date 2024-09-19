import 'package:flutter/material.dart';
import 'question.dart'; // Importa o widget Question para exibir a pergunta.
import 'answer.dart'; // Importa o widget Answer para exibir as respostas.

class Questionnaire extends StatelessWidget {
  // Lista de perguntas, onde cada pergunta é um Map que contém a "wording" (pergunta) e "answer" (respostas).
  final List<Map<String, Object>> questions;

  // Índice da pergunta atual selecionada.
  final int questionSelected;

  // Função que será chamada quando uma resposta for selecionada, passando um valor inteiro (note).
  final void Function(int) answered;

  // Construtor da classe, que exige a lista de perguntas, a pergunta selecionada, e a função answered.
  const Questionnaire({
    super.key, // Chave padrão para widgets.
    required this.questions, // Obrigatório passar as perguntas.
    required this.questionSelected, // Obrigatório passar a pergunta selecionada.
    required this.answered, // Obrigatório passar a função de resposta.
  });

  // Getter que verifica se ainda há perguntas a serem respondidas.
  bool get select {
    return questionSelected < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    // Se houver perguntas, obtém a lista de respostas; caso contrário, atribui null.
    List<Map<String, Object>>? answers = select
        ? questions[questionSelected]["answer"] as List<Map<String, Object>>?
        : null;

    // Retorna um layout em forma de coluna que contém a pergunta e suas respectivas respostas.
    return Column(
      children: <Widget>[
        // Exibe a pergunta atual usando o widget Question.
        Question(questions[questionSelected]["wording"] as String),

        // Se houver respostas (answers != null), mapeia a lista de respostas para o widget Answer.
        if (answers != null)
          ...answers.map(
            (answerData) => Answer(
              answerData['wording'] as String, // Exibe o texto da resposta.
              () => answered(answerData['note']
                  as int), // Quando clicado, chama a função answered com o valor de 'note'.
            ),
          ),
      ],
    );
  }
}
