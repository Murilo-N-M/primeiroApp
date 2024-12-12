import 'package:flutter/material.dart';

void main() {
  runApp(const MinhaClasse());
}

class MinhaClasse extends StatelessWidget {
  const MinhaClasse({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Couting game',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 0, 183, 255)),
        useMaterial3: true,
      ),
      home: const PrimeiraPagina(titulo: 'Clique no botão para +1'),
    );
  }
}

class PrimeiraPagina extends StatefulWidget {
  const PrimeiraPagina({
    super.key,
    required this.titulo,
  });

  final String titulo;

  @override
  State<PrimeiraPagina> createState() => _PrimeiraPaginaState();
}

class _PrimeiraPaginaState extends State<PrimeiraPagina> {
  int _contagem = 0;

  int getContagem() {
    return _contagem;
  }

  void _incrementCounter() {
    setState(() {
      _contagem++;
    });
  }

  void _dobrarContagem() {
    setState(() {
      _contagem *= 2;
    });
  }

  void _quaduplicarContagem() {
    setState(() {
      _contagem *= 4;
    });
  }

  void _elevarContagem() {
    setState(() {
      _contagem *= _contagem;
    });
  }

  void _zerarContagem() {
    setState(() {
      _contagem = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.titulo),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {},
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Você apertou o botão:'),
            Text(
              '$_contagem',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              'vezes:',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Adcionar',
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 8),
          if (getContagem() >= 20)
            FloatingActionButton(
              onPressed: _dobrarContagem,
              tooltip: 'Duplicar',
              child: const Icon(Icons.keyboard_control_key),
            ),
          const SizedBox(width: 8),
          if (getContagem() >= 25000000)
            FloatingActionButton(
              onPressed: _quaduplicarContagem,
              tooltip: 'Triplicar',
              child: const Icon(Icons.keyboard_double_arrow_up),
            ),
          const SizedBox(width: 8),
          if (getContagem() >= 1e100)
            FloatingActionButton(
              onPressed: _elevarContagem,
              tooltip: 'Elevar ao quadrado',
              child: const Icon(Icons.open_with),
            ),
          const SizedBox(width: 8),
          if (getContagem() >= double.infinity)
            FloatingActionButton(
              onPressed: _zerarContagem,
              tooltip: 'Resetar',
              child: const Icon(Icons.cancel),
            ),
        ],
      ),
    );
  }
}
