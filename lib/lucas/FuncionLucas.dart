import 'package:flutter/cupertino.dart';

class Lucas extends StatelessWidget {
  const Lucas({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: "Generador de Números de Lucas",
      home: LucasNumbersApp(),
      theme: CupertinoThemeData(
        brightness: Brightness.light
      ),
      debugShowCheckedModeBanner: false ,
    );
  }
}



class LucasNumbersApp extends StatefulWidget {
  const LucasNumbersApp({super.key});
  @override
  _LucasNumbersAppState createState() => _LucasNumbersAppState();
}

class _LucasNumbersAppState extends State<LucasNumbersApp> {
  final TextEditingController _valorInicialController = TextEditingController();
  final TextEditingController _cantidadController = TextEditingController();
  List<int> lucasNumbers = [];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Generador de Números de Lucas'),
      ),
      child: SafeArea(
        child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CupertinoTextField(
              controller: _valorInicialController,
              keyboardType: TextInputType.number,
              placeholder: 'Valor Inicial',
            ),
            const SizedBox(height: 16),
            CupertinoTextField(
              controller: _cantidadController,
              keyboardType: TextInputType.number,
              placeholder: 'Cantidad de números a generar',
            ),
            const SizedBox(height: 16),
            CupertinoButton.filled(
              onPressed: () {
                generarNumeros();
              },
              child: const Text('Generar'),
              
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: lucasNumbers.length,
                itemBuilder: (context, index) {
                  return NumerosLucasWidget(number: lucasNumbers[index]);
                },
              ),
            ),
          ],
        ),
      ),
      )
    );
  }

  void generarNumeros() {
    int valorInicial = int.tryParse(_valorInicialController.text) ?? 2;
    int total = int.tryParse(_cantidadController.text) ?? 0;
    List<int> resultado = [];

    int a = valorInicial;
    int b = 1;

    for (int i = 0; i < total; i++) {
      resultado.add(a);
      int valorSiguiente = a + b;
      a = b;
      b = valorSiguiente;
    }

    setState(() {
      lucasNumbers = resultado;
    });
  }
}

class NumerosLucasWidget extends StatelessWidget {
  final int number;

  const NumerosLucasWidget({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGreen.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        'Número de Lucas: $number',
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}