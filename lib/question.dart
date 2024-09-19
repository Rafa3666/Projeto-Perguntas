import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  //Define a classe Question, que é uma widget que se estente a um stateless (imutável).

  final String wording; //Declara a variável final wording.

  const Question(this.wording, {super.key});

// Construtor da classe 'Question'. Recebe um parâmetro (wording) e o atribui à variável de instância 'wording'.
// O uso de 'this.wording' é um atalho para atribuir o valor diretamente ao atributo da classe.

  @override
  Widget build(BuildContext context) {
    // Sobrescreve o método 'build', que é responsável por construir a interface do widget.
    return Container(
      // Retorna um widget 'Container', que pode ser usado para agrupar e configurar outros widgets.
      width: double
          .infinity, // Ocupar toda a largura disponível na tela (infinity).
      margin: const EdgeInsets.all(
          10), // Adiciona a margem em todos os lados do container, com 10 pixels.
      child: Text(
        wording,
        style: const TextStyle(fontSize: 28), // Adiciona o tamanho da fonte.
        textAlign: TextAlign.center, // Alinha o texto para o centro da tela.
      ),
    );
  }
}
