import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool checkboxValue = false;
  bool switchValue = false;
  String radioValue = "Opção 1";
  double sliderValue = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Widgets Interativos"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [

            // 🔹 CHECKBOX
            buildCard(
              icon: Icons.check_box,
              title: "Checkbox",
              child: CheckboxListTile(
                title: const Text("Aceitar termos"),
                value: checkboxValue,
                activeColor: Colors.deepPurple,
                onChanged: (value) {
                  setState(() {
                    checkboxValue = value!;
                  });
                },
              ),
            ),

            // 🔹 SWITCH
            buildCard(
              icon: Icons.toggle_on,
              title: "Switch",
              child: SwitchListTile(
                title: const Text("Ativar notificações"),
                value: switchValue,
                activeColor: Colors.green,
                onChanged: (value) {
                  setState(() {
                    switchValue = value;
                  });
                },
              ),
            ),

            // 🔹 RADIO
            buildCard(
              icon: Icons.radio_button_checked,
              title: "Radio",
              child: Column(
                children: [
                  RadioListTile(
                    title: const Text("Opção 1"),
                    value: "Opção 1",
                    groupValue: radioValue,
                    onChanged: (value) {
                      setState(() {
                        radioValue = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text("Opção 2"),
                    value: "Opção 2",
                    groupValue: radioValue,
                    onChanged: (value) {
                      setState(() {
                        radioValue = value.toString();
                      });
                    },
                  ),
                ],
              ),
            ),

            // 🔹 SLIDER
            buildCard(
              icon: Icons.tune,
              title: "Slider",
              child: Column(
                children: [
                  Slider(
                    value: sliderValue,
                    min: 0,
                    max: 100,
                    divisions: 10,
                    activeColor: Colors.deepPurple,
                    label: sliderValue.round().toString(),
                    onChanged: (value) {
                      setState(() {
                        sliderValue = value;
                      });
                    },
                  ),
                  Text(
                    "Valor: ${sliderValue.toStringAsFixed(0)}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard({required IconData icon, required String title, required Widget child}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 5,
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.deepPurple),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Divider(),
            child,
          ],
        ),
      ),
    );
  }
}