import 'package:flutter/material.dart';

// Definição de um widget Stateless chamado Result.
class Result extends StatelessWidget {
  // Atributos finais, pois não mudam após a inicialização.
  final int note; // Nota final do usuário.
  final void Function()
      whenRestartQuest; // Função para reiniciar o questionário.

  // Construtor que inicializa os atributos.
  Result(this.note, this.whenRestartQuest);

  // Getter que retorna uma mensagem de acordo com a nota.
  String get resultMessage {
    if (note < 5) {
      // Se a nota for menor que 5, a mensagem retornada é "Burro!".
      return "Burro!";
    } else if (note < 10) {
      // Se a nota for menor que 10, a mensagem retornada é "Tá no caminho...".
      return "Tá no caminho...";
    } else {
      // Caso contrário, a mensagem retornada é "Oia que menino inteligente".
      return "Oia que menino inteligente";
    }
  }

  // Método build para desenhar a interface do widget.
  @override
  Widget build(BuildContext context) {
    // Retorna uma coluna que centraliza os widgets na tela.
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, // Centraliza verticalmente.
      children: [
        Center(
          child: Text(
            resultMessage, // Exibe a mensagem baseada na nota.
            style: const TextStyle(
              fontSize: 28, // Tamanho do texto é 28.
            ),
          ),
        ),
        TextButton(
          onPressed:
              whenRestartQuest, // Chama a função para reiniciar o questionário quando clicado.
          style: TextButton.styleFrom(
            foregroundColor: Colors.white, // Cor do texto do botão.
            backgroundColor: Colors.blue, // Cor de fundo do botão.
          ),
          child: const Text(
            "Reiniciar?", // Texto dentro do botão.
            style: TextStyle(
              fontSize: 18, // Tamanho do texto dentro do botão.
            ),
          ),
        )
      ],
    );
  }
}
