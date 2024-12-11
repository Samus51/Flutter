import 'dart:math';
import 'package:flutter/material.dart';
import 'package:holamundo/drawer/menu_lateral.dart';

class Enlace11 extends StatelessWidget {
  const Enlace11({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Formulario Estudiantil y Adivina el Número',
      theme: theme, // Usar el theme global de main.dart
      home: const FormularioEstudiantil(),
    );
  }
}

class FormularioEstudiantil extends StatefulWidget {
  const FormularioEstudiantil({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FormularioEstudiantilState createState() => _FormularioEstudiantilState();
}

class _FormularioEstudiantilState extends State<FormularioEstudiantil> {
  final _formKey = GlobalKey<FormState>();
  String _nivelEducacional = 'ESO';
  double _horasEstudioDiarias = 0.0;
  bool _aceptaTerminos = false;

  final List<String> _nivelesEducativos = [
    'ESO',
    'Bachillerato',
    'FP',
    'Grado Universitario',
    'Máster'
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 11'),
        backgroundColor:
            theme.appBarTheme.backgroundColor, // Usar color del tema
      ),
      drawer: Drawer(
        backgroundColor: theme.scaffoldBackgroundColor,
        child: const MenuLateral(),
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  labelStyle:
                      TextStyle(color: theme.textTheme.bodyLarge?.color),
                ),
                style: TextStyle(color: theme.textTheme.bodyLarge?.color),
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Este campo es obligatorio';
                  }
                  if (!RegExp(r'^[A-Za-zÁÉÍÓÚáéíóúÑñ\s]+$').hasMatch(value)) {
                    return 'Por favor, introduce un nombre válido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Correo',
                  labelStyle:
                      TextStyle(color: theme.textTheme.bodyLarge?.color),
                ),
                style: TextStyle(color: theme.textTheme.bodyLarge?.color),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return 'Introduce un correo válido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Teléfono',
                  labelStyle:
                      TextStyle(color: theme.textTheme.bodyLarge?.color),
                ),
                style: TextStyle(color: theme.textTheme.bodyLarge?.color),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length != 9) {
                    return 'Introduce un número de teléfono válido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _nivelEducacional,
                decoration: InputDecoration(
                  labelText: 'Nivel Educacional',
                  labelStyle:
                      TextStyle(color: theme.textTheme.bodyLarge?.color),
                ),
                onChanged: (value) {
                  setState(() {
                    _nivelEducacional = value!;
                  });
                },
                items: _nivelesEducativos
                    .map((nivel) => DropdownMenuItem(
                          value: nivel,
                          child: Text(nivel,
                              style: TextStyle(
                                  color: theme.textTheme.bodyLarge?.color)),
                        ))
                    .toList(),
                dropdownColor: theme
                    .colorScheme.surface, // Usar el color de fondo del tema
                style: TextStyle(color: theme.textTheme.bodyLarge?.color),
              ),
              SizedBox(height: 20),
              Center(
                  child: Text("Horas de estudio",
                      style:
                          TextStyle(color: theme.textTheme.bodyLarge?.color))),
              Slider(
                value: _horasEstudioDiarias,
                min: 0,
                max: 12,
                divisions: 12,
                label: '${_horasEstudioDiarias.toInt()} horas',
                onChanged: (value) {
                  setState(() {
                    _horasEstudioDiarias = value;
                  });
                },
                activeColor:
                    Colors.blueAccent, // Azul brillante para la parte activa
                inactiveColor: Colors.blueAccent.withOpacity(
                    0.3), // Azul con opacidad reducida para la parte inactiva
              ),
              CheckboxListTile(
                title: Text('Acepto los términos y condiciones',
                    style: TextStyle(color: theme.textTheme.bodyLarge?.color)),
                value: _aceptaTerminos,
                onChanged: (bool? value) {
                  setState(() {
                    _aceptaTerminos = value!;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Formulario enviado')),
                    );
                  }
                },
                child: const Text('Enviar'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AdivinaElNumero()),
                  );
                },
                child: const Text('Adivina el Número'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AdivinaElNumero extends StatefulWidget {
  const AdivinaElNumero({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AdivinaElNumeroState createState() => _AdivinaElNumeroState();
}

class _AdivinaElNumeroState extends State<AdivinaElNumero> {
  final TextEditingController _controller = TextEditingController();
  late int _numeroSecreto;
  String _mensaje = '';

  @override
  void initState() {
    super.initState();
    _reiniciarJuego();
  }

  void _reiniciarJuego() {
    _numeroSecreto = Random().nextInt(100) + 1;
    setState(() {
      _mensaje = '¡Nuevo juego! Adivina el número.';
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Adivina el Número'),
        backgroundColor: theme.appBarTheme.backgroundColor,
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Introduce un número entre 1 y 100',
                labelStyle: TextStyle(color: theme.textTheme.bodyLarge?.color),
              ),
              onFieldSubmitted: (value) => _adivinarNumero(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _adivinarNumero,
              child: const Text('Adivina'),
            ),
            const SizedBox(height: 20),
            Text(_mensaje,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: theme.textTheme.bodyLarge?.color)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _reiniciarJuego,
              child: const Text('Reiniciar Juego'),
            ),
          ],
        ),
      ),
    );
  }

  void _adivinarNumero() {
    final int? numero = int.tryParse(_controller.text);
    if (numero == null || numero > 100 || numero < 0) {
      setState(() {
        _mensaje = 'Por favor, ingresa un número válido.';
      });
    } else if (numero < _numeroSecreto) {
      setState(() {
        _mensaje = 'El número es mayor. Intenta nuevamente.';
      });
    } else if (numero > _numeroSecreto) {
      setState(() {
        _mensaje = 'El número es menor. Intenta nuevamente.';
      });
    } else {
      setState(() {
        _mensaje = '¡Correcto! Has adivinado el número.';
      });
    }
  }
}
