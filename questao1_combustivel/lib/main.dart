import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CombustivelPage(),
    );
  }
}

class CombustivelPage extends StatefulWidget {
  @override
  _CombustivelPageState createState() => _CombustivelPageState();
}

class _CombustivelPageState extends State<CombustivelPage> {

  TextEditingController etanolController = TextEditingController();
  TextEditingController gasolinaController = TextEditingController();

  String resultado = "";

  void calcular() {

    double etanol = double.tryParse(etanolController.text) ?? 0;
    double gasolina = double.tryParse(gasolinaController.text) ?? 0;

    if (etanol == 0 || gasolina == 0) {
      setState(() {
        resultado = "Digite valores válidos";
      });
      return;
    }

    if (etanol <= gasolina * 0.7) {
      setState(() {
        resultado = "Compensa usar Etanol";
      });
    } else {
      setState(() {
        resultado = "Compensa usar Gasolina";
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Etanol ou Gasolina"),
      ),

      body: Padding(
        padding: EdgeInsets.all(20),

        child: Column(
          children: [

            TextField(
              controller: etanolController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Preço do Etanol",
              ),
            ),

            SizedBox(height: 20),

            TextField(
              controller: gasolinaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Preço da Gasolina",
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: calcular,
              child: Text("Calcular"),
            ),

            SizedBox(height: 20),

            Text(
              resultado,
              style: TextStyle(fontSize: 22),
            )

          ],
        ),
      ),
    );
  }
}