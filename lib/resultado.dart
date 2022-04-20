import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  String texto;
  final int pontuacao;
  final void Function() reiniciarFormulario;
  Resultado(this.texto, this.pontuacao, this.reiniciarFormulario);

  String get fraseResultado {
    if (pontuacao < 20) {
      return 'Parabéns';
    } else if (pontuacao < 22) {
      return 'You are very good';
    } else {
      return 'Impressionante!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            texto + " " + fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        FlatButton(
            textColor: Colors.blue,
            onPressed: reiniciarFormulario,
            child: Text(
              'Reiniciar Questionário',
              style: TextStyle(fontSize: 18),
            ))
      ],
    );
  }
}
