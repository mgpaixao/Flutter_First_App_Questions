import 'dart:collection';

import 'package:flutter/material.dart';
import 'main.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() quandoSelecionado;

  Resposta(this.texto, this.quandoSelecionado);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        textColor: Colors.white,
        child: Text(
          texto,
          style: TextStyle(fontSize: 19),
        ),
        color: Colors.blue,
        onPressed: quandoSelecionado,
      ),
    );
  }
}
