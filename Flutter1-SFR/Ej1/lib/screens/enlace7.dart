import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../drawer/menu_lateral.dart'; 

class Enlace7 extends StatelessWidget {
  const Enlace7({super.key});

  @override
  Widget build(BuildContext context) {
    return const Micontador();
  }
}

class Micontador extends StatefulWidget {
  const Micontador({super.key});

  @override
  State<Micontador> createState() => _MicontadorState();
}

class _MicontadorState extends State<Micontador> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const Text('Samuel Fernández Rodríguez'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: const MenuLateral(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "Has pulsado $contador veces",
              style: GoogleFonts.robotoCondensed(
                textStyle: const TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () => decrementar(),
                  tooltip: 'Restar',
                ),
                IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () => reiniciar(),
                  tooltip: 'Resetear',
                ),
                FloatingActionButton(
                  onPressed: () => incrementar(),
                  tooltip: 'Incrementar',
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void incrementar() {
    setState(() {
      contador++;
    });
  }

  void decrementar() {
    setState(() {
      contador--;
    });
  }

  void reiniciar() {
    setState(() {
      contador = 0;
    });
  }
}
