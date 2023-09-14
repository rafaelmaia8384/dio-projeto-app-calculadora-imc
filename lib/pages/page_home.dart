import 'package:flutter/material.dart';

import '../models/model_imc.dart';
import '../widgets/widget_imc_layout.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();
  final List<ModelIMC> _imcList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Informe seu peso e altura:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _pesoController,
                    decoration: const InputDecoration(
                      labelText: 'Peso (kg)',
                    ),
                    keyboardType: const TextInputType.numberWithOptions(
                      signed: true,
                      decimal: true,
                    ),
                    validator: (value) {
                      final v = value?.replaceAll(',', '.');
                      if (v == null || v.isEmpty) {
                        return 'Peso é obrigatório.';
                      } else if (double.tryParse(v) == null) {
                        return 'Peso deve ser um número válido.';
                      } else if (double.parse(v) <= 0.0) {
                        return 'Peso deve ser maior que zero.';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _alturaController,
                    decoration: const InputDecoration(
                      labelText: 'Altura (m)',
                    ),
                    keyboardType: const TextInputType.numberWithOptions(
                      signed: true,
                      decimal: true,
                    ),
                    validator: (value) {
                      final v = value?.replaceAll(',', '.');
                      if (v == null || v.isEmpty) {
                        return 'Altura é obrigatória.';
                      } else if (double.tryParse(v) == null) {
                        return 'Altura deve ser um número válido.';
                      } else if (double.parse(v) <= 0.0) {
                        return 'Altura deve ser maior que zero.';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final double peso =
                        double.parse(_pesoController.text.replaceAll(',', '.'));
                    final double altura = double.parse(
                        _alturaController.text.replaceAll(',', '.'));
                    final imc = ModelIMC(
                      peso: peso,
                      altura: altura,
                    );
                    setState(() {
                      _imcList.insert(0, imc);
                    });
                    _pesoController.clear();
                    _alturaController.clear();
                    FocusScope.of(context).requestFocus(FocusNode());
                  }
                },
                child: const Text('Adicionar IMC'),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.shade300,
                ),
                child: _imcList.isEmpty
                    ? const Center(
                        child: Text(
                          'Nenhum IMC adicionado.',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      )
                    : ListView(
                        children: [
                          for (final imc in _imcList)
                            WidgetIMCLayout(
                              imc: imc,
                            ),
                          const SizedBox(
                            height: 32,
                          ),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
