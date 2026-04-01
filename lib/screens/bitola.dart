import 'package:flutter/material.dart';

class Bitola extends StatefulWidget {
  const Bitola({super.key});

  @override
  State<Bitola> createState() => _BitolaState();
}

class _BitolaState extends State<Bitola> {
  double corrente = 0;
  double distancia = 0;

  double bitola110 = 0;
  double bitola220 = 0;

  void calcular() {
    if (corrente > 0 && distancia > 0) {
      bitola110 = (2 * corrente * distancia) / 294.64;
      bitola220 = (2 * corrente * distancia) / 510.4;
    } else {
      bitola110 = 0;
      bitola220 = 0;
    }

    setState(() {});
  }

  void mostrarResultado() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Resultado"),
        content: Text(
          "110V: ${bitola110.toStringAsFixed(2)} mm²\n"
          "220V: ${bitola220.toStringAsFixed(2)} mm²",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bitola de Fio"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: "Corrente (A)",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) =>
                    corrente = double.tryParse(value) ?? 0,
              ),
              const SizedBox(height: 15),

              TextField(
                decoration: const InputDecoration(
                  labelText: "Distância (m)",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) =>
                    distancia = double.tryParse(value) ?? 0,
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  calcular();
                  mostrarResultado();
                },
                child: const Text("Calcular"),
              ),

              const SizedBox(height: 20),

              Text(
                "Bitola 110V: ${bitola110.toStringAsFixed(2)} mm²",
              ),
              Text(
                "Bitola 220V: ${bitola220.toStringAsFixed(2)} mm²",
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Voltar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}