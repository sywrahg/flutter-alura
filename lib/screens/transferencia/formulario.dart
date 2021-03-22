import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando Transferência';

const _rotuloCampoValor = 'Valor:';
const _dicaCampoValor = '0.00';

const _rotuloCampoNumeroConta = 'Número da conta:';
const _dicaCampoNumeroConta = '0000';

const _textoBotaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controllerCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controllerCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
              controlador: _controllerCampoNumeroConta,
              rotulo: _rotuloCampoNumeroConta,
              dica: _dicaCampoNumeroConta,
            ),
            Editor(
                controlador: _controllerCampoValor,
                rotulo: _rotuloCampoValor,
                dica: _dicaCampoValor,
                icone: Icons.monetization_on),
            RaisedButton(
              child: Text(_textoBotaoConfirmar),
              onPressed: () {
                _criaTransferencia(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controllerCampoNumeroConta.text);
    final double valor = double.tryParse(_controllerCampoValor.text);

    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
