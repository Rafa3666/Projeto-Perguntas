import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String wording;
  final void Function() whenSelected;

  const Answer(this.wording, this.whenSelected, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue, // Cor de fundo do botão.
          foregroundColor: Colors.white, // Cor do texto do botão.
        ),
        onPressed: whenSelected,
        child: Text(wording), // Define a função ao ser pressionado.
      ),
    );
  }
}
