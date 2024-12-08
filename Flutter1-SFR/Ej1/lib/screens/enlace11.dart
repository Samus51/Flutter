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
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFE0F7FA),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 22,
          ),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        scaffoldBackgroundColor: theme.scaffoldBackgroundColor,
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: theme.textTheme.bodyLarge?.color),
          hintStyle: TextStyle(color: theme.textTheme.bodyMedium?.color),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: theme.primaryColor),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: theme.primaryColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: theme.primaryColor.withOpacity(0.6)),
          ),
          errorStyle: TextStyle(color: Colors.red),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
        primarySwatch: Colors.blue,
      ),
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
                decoration: const InputDecoration(labelText: 'Nombre'),
                style: TextStyle(color: Colors.white),
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
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Correo'),
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return 'Introduce un correo válido';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Teléfono'),
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length != 9) {
                    return 'Introduce un número de teléfono válido';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              DropdownButtonFormField<String>(
                value: _nivelEducacional,
                decoration:
                    const InputDecoration(labelText: 'Nivel Educacional'),
                onChanged: (value) {
                  setState(() {
                    _nivelEducacional = value!;
                  });
                },
                items: _nivelesEducativos
                    .map((nivel) => DropdownMenuItem(
                          value: nivel,
                          child: Text(
                            nivel,
                            style: TextStyle(color: Colors.white),
                          ),
                        ))
                    .toList(),
                dropdownColor: Colors.black,
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Text("Horas de estudio",
                      style: TextStyle(color: Colors.white))),
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
              ),
              CheckboxListTile(
                title: const Text('Acepto los términos y condiciones',
                    style: TextStyle(color: Colors.white)),
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
              SizedBox(
                height: 20,
              ),
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
              decoration: const InputDecoration(
                  labelText: 'Introduce un número entre 1 y 100'),
              onFieldSubmitted: (value) => _adivinarNumero(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _adivinarNumero,
              child: const Text('Adivina'),
            ),
            const SizedBox(height: 20),
            Text(_mensaje,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
        _mensaje = 'El número es mayor. ¡Intenta de nuevo!';
      });
    } else if (numero > _numeroSecreto) {
      setState(() {
        _mensaje = 'El número es menor. ¡Intenta de nuevo!';
      });
    } else {
      setState(() {
        _mensaje = '¡Felicidades! Has acertado el número.';
      });
    }
  }
}
