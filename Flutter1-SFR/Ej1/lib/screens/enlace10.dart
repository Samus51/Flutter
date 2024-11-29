import 'package:flutter/material.dart';
import 'dart:math';

import 'package:holamundo/drawer/menu_lateral.dart';

class Enlace10 extends StatefulWidget {
  const Enlace10({super.key});

  @override
  State<Enlace10> createState() => _JuegoSieteYMediaState();
}

class _JuegoSieteYMediaState extends State<Enlace10> {
  final List<String> _cartas = [
    'As',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    'Sota',
    'Caballo',
    'Rey'
  ];
  final List<double> _valores = [1, 2, 3, 4, 5, 6, 7, 0.5, 0.5, 0.5];
  final Random _random = Random();

  final List<String> _manoJugador = [];
  final List<String> _manoMaquina = [];
  double _puntuacionJugador = 0;
  double _puntuacionMaquina = 0;
  bool _jugadorPlantado = false;
  bool _maquinaPlantada = false;
  String _mensaje = '';

  void _robarCartaJugador() {
    if (_jugadorPlantado) return;
    setState(() {
      int index = _random.nextInt(_cartas.length);
      _manoJugador.add(_cartas[index]);
      _puntuacionJugador += _valores[index];

      if (_puntuacionJugador > 7.5) {
        _mensaje = '¡Te pasaste! Gana la máquina.';
        _finalizarJuego();
      }
    });
  }

  void _robarCartaMaquina() {
    if (_maquinaPlantada) return;
    setState(() {
      if (_puntuacionMaquina < 5.5 ||
          (_puntuacionMaquina <= _puntuacionJugador &&
              _puntuacionMaquina < 7.5)) {
        int index = _random.nextInt(_cartas.length);
        _manoMaquina.add(_cartas[index]);
        _puntuacionMaquina += _valores[index];
      } else {
        _maquinaPlantada = true;
      }

      if (_puntuacionMaquina > 7.5) {
        _mensaje = '¡La máquina se pasó! Ganas tú.';
        _finalizarJuego();
      }
    });
  }

  void _plantarseJugador() {
    setState(() {
      _jugadorPlantado = true;
      _turnoMaquina();
    });
  }

  void _turnoMaquina() {
    while (!_maquinaPlantada && _puntuacionMaquina <= 7.5) {
      if (_puntuacionMaquina > _puntuacionJugador) {
        _maquinaPlantada = true;
      } else {
        _robarCartaMaquina();
      }
    }

    if (_maquinaPlantada || _puntuacionMaquina > 7.5) {
      _determinarGanador();
    }
  }

  void _determinarGanador() {
    if (_puntuacionJugador > 7.5) {
      _mensaje = '¡Te pasaste! Gana la máquina.';
    } else if (_puntuacionMaquina > 7.5) {
      _mensaje = '¡La máquina se pasó! Ganas tú.';
    } else if (_puntuacionJugador > _puntuacionMaquina) {
      _mensaje =
          '¡Ganaste! Tu puntuación: $_puntuacionJugador. Máquina: $_puntuacionMaquina.';
    } else if (_puntuacionJugador < _puntuacionMaquina) {
      _mensaje =
          '¡Perdiste! Máquina: $_puntuacionMaquina. Tu puntuación: $_puntuacionJugador.';
    } else {
      _mensaje = '¡Empate! Ambos tienen $_puntuacionJugador.';
    }
    _finalizarJuego();
  }

  void _finalizarJuego() {
    setState(() {
      _jugadorPlantado = true;
      _maquinaPlantada = true;
    });
  }

  void _reiniciarJuego() {
    setState(() {
      _manoJugador.clear();
      _manoMaquina.clear();
      _puntuacionJugador = 0;
      _puntuacionMaquina = 0;
      _jugadorPlantado = false;
      _maquinaPlantada = false;
      _mensaje = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Usamos el tema global

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Ejercicio 10 NO DUAL'),
      ),
      drawer: MenuLateral(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Tu Mano: ${_manoJugador.join(', ')}', style: theme.textTheme.bodyMedium),
            Text('Tu Puntuación: $_puntuacionJugador', style: theme.textTheme.bodyMedium),
            const SizedBox(height: 10),
            Text(
                'Mano Máquina: ${_jugadorPlantado ? _manoMaquina.join(', ') : '[Oculta]'}',
                style: theme.textTheme.bodyMedium),
            Text(
                'Puntuación Máquina: ${_jugadorPlantado ? _puntuacionMaquina : '[Oculta]'}',
                style: theme.textTheme.bodyMedium),
            const SizedBox(height: 20),
            if (_mensaje.isNotEmpty)
              Text(
                _mensaje,
                style: const TextStyle(fontSize: 18, color: Colors.red),
                textAlign: TextAlign.center,
              ),
            const SizedBox(height: 20),
            if (!_jugadorPlantado)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _robarCartaJugador,
                    child: const Text("Robar Carta"),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _plantarseJugador,
                    child: const Text("Plantarse"),
                  ),
                ],
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _reiniciarJuego,
              child: const Text("Reiniciar Juego"),
            ),
          ],
        ),
      ),
    );
  }
}
