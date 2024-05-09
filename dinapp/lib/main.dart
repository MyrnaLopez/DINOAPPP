import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String nombre = '';
  String nombreDinosaurio = '';
  String imagenDinosaurio = '';

  final Map<String, String> imagenesDinosaurios = {
    'Tyrannosaurus': 'assets/tyrannosaurus.png',
    'Stegosaurus': 'assets/stegosaurus.png',
    'Velociraptor': 'assets/velociraptor.png',
    'Triceratops': 'assets/triceratops.png',
    'Brachiosaurus': 'assets/brachiosaurus.png',
    'Ankylosaurus': 'assets/ankylosaurus.png',
    'Diplodocus': 'assets/diplodocus.png',
    'Pterodactyl': 'assets/pterodactyl.png',
    'Allosaurus': 'assets/allosaurus.png',
    'Spinosaurus': 'assets/spinosaurus.png',
  };

  final List<String> nombresDinosaurios = [
    'Tyrannosaurus',
    'Stegosaurus',
    'Velociraptor',
    'Triceratops',
    'Brachiosaurus',
    'Ankylosaurus',
    'Diplodocus',
    'Pterodactyl',
    'Allosaurus',
    'Spinosaurus',
  ];

  void generarDinosaurio() {
    setState(() {
      if (nombre.isNotEmpty) {
        final random = Random();
        nombreDinosaurio = nombresDinosaurios[random.nextInt(nombresDinosaurios.length)];
        imagenDinosaurio = imagenesDinosaurios[nombreDinosaurio] ?? '';
      } else {
        nombreDinosaurio = '';
        imagenDinosaurio = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dinosaurio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('¿Qué dinosaurio eres?'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Ingresa tu nombre:',
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  onChanged: (text) {
                    setState(() {
                      nombre = text;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Nombre',
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  generarDinosaurio();
                },
                child: Text('Generar'),
              ),
              SizedBox(height: 20),
              if (nombreDinosaurio.isNotEmpty)
                Column(
                  children: [
                    Text(
                      'Tu dinosaurio:',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      nombreDinosaurio,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    if (imagenDinosaurio.isNotEmpty)
                      Image.asset(
                        imagenDinosaurio,
                        height: 150,
                      ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}