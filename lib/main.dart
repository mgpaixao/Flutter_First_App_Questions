import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';

main() {
  runApp(const PerguntaAPP());
}

class PerguntaAPPState extends State<PerguntaAPP> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  void _responder(int pontuacao) {
    setState(() {
      _perguntaSelecionada++;
      _pontuacaoTotal += pontuacao;
    });
    print(_pontuacaoTotal);
  }

  void reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  final _perguntas = const [
    {
      'texto': 'Qual a sua cor favorita',
      'respostas': [
        {'texto': 'Preto', 'nota': 12},
        {'texto': 'Vermelho', 'nota': 15},
        {'texto': 'Verde', 'nota': 17},
        {'texto': 'Branco', 'nota': 19},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito',
      'respostas': [
        {'texto': 'Coelho', 'nota': 10},
        {'texto': 'Cobra', 'nota': 9},
        {'texto': 'Elefante', 'nota': 8},
        {'texto': 'Leão', 'nota': 7},
      ],
    },
    {
      'texto': 'Qual o instrutor favorito?',
      'respostas': [
        {'texto': 'Paixao', 'nota': 10},
        {'texto': 'Leo', 'nota': 7},
        {'texto': 'Matheus', 'nota': 5},
      ],
    },
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    //List<Widget> widgets = respostas.map((t) => Resposta(t, responder)).toList();

    //for (var textResp in respostas) {
    // widgets.add(Resposta(textResp, responder));
    //}

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Perguntas'),
          ),
          body: temPerguntaSelecionada
              ? Questionario(
                  perguntas: _perguntas,
                  perguntaSelecionada: _perguntaSelecionada,
                  responder: _responder)
              : Resultado(
                  'Well done !', _pontuacaoTotal, reiniciarQuestionario)),
    );
  }
}

class PerguntaAPP extends StatefulWidget {
  const PerguntaAPP({Key? key}) : super(key: key);

  @override
  State<PerguntaAPP> createState() {
    return PerguntaAPPState();
  }
}
