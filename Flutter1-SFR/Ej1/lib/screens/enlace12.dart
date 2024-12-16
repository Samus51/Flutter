import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'screens.dart';

void main() => runApp(
      MaterialApp(
        home: Enlace12(),
        debugShowCheckedModeBanner: false,
      ),
    );

class Enlace12 extends StatelessWidget {
  const Enlace12({super.key});

  @override
  Widget build(BuildContext context) {
    return ConditionalForm();
  }
}

class ConditionalForm extends StatefulWidget {
  const ConditionalForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ConditionalFormState createState() => _ConditionalFormState();
}

class _ConditionalFormState extends State<ConditionalForm> {
  bool isLeft = true;
  bool isDateSelected = false;
  final _formKeyLeft = GlobalKey<FormState>();
  final _formKeyRight = GlobalKey<FormState>();

  // Controladores para el formulario de la izquierda
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool hasChildren = false;
  List<TextEditingController> childrenAgeControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  // Controladores para el formulario de la derecha
  DateTime? birthDate;
  String? selectedCity;
  Map<String, bool> hobbies = {
    "Deporte": false,
    "Lectura": false,
    "Cine": false,
    "Viajar": false,
    "Música": false,
  };
  String? gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ejercicio 12 NO DUAL",
            style: TextStyle(
                color: Theme.of(context).textTheme.displayLarge?.color)),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      drawer: MenuLateral(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => setState(() {
                  isLeft = true;
                  isDateSelected = false;
                }),
                child: Text("Izquierda"),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () => setState(() {
                  isLeft = false;
                }),
                child: Text("Derecha"),
              ),
            ],
          ),
          Expanded(
            child: Form(
              key: isLeft ? _formKeyLeft : _formKeyRight,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: isLeft ? buildLeftForm() : buildRightForm(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Solo validamos el formulario del lado que está activo
              bool isLeftFormValid = isLeft
                  ? _formKeyLeft.currentState?.validate() ?? false
                  : true;

              bool isRightFormValid = !isLeft
                  ? _formKeyRight.currentState?.validate() ?? false
                  : true;

              bool isDateSelected = birthDate != null;

              if (isLeftFormValid && isRightFormValid && isDateSelected) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Formulario válido, todo en orden!"),
                  backgroundColor: Colors.green,
                ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Por favor, corrija los errores."),
                  backgroundColor: Colors.red,
                ));
              }
            },
            child: Text("Enviar"),
          )
        ],
      ),
    );
  }

  // Formulario para la posición izquierda
  Widget buildLeftForm() {
    return Column(
      children: [
        TextFormField(
          controller: fullNameController,
          decoration: InputDecoration(
            labelText: "Nombre completo",
            labelStyle:
                TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color),
          ),
          keyboardType: TextInputType.name,
          validator: (value) {
            if (value == null ||
                value.isEmpty ||
                !RegExp(r"^[A-ZÁÉÍÓÚÑ][a-záéíóúñ]+(\s[A-ZÁÉÍÓÚÑ][a-záéíóúñ]+)+$")
                    .hasMatch(value)) {
              return "Ingrese un nombre completo válido (ej. Juan Pérez)";
            }
            return null;
          },
        ),
        TextFormField(
          controller: emailController,
          decoration: InputDecoration(
            labelText: "Correo electrónico",
            labelStyle:
                TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color),
          ),
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null ||
                !RegExp(r'^\w+[\w.-]*@\w+\.[a-z]{2,3}(\.[a-z]{2})?$')
                    .hasMatch(value)) {
              return "Ingrese un correo válido";
            }
            return null;
          },
        ),
        TextFormField(
          controller: phoneController,
          decoration: InputDecoration(
            labelText: "Teléfono",
            labelStyle:
                TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color),
          ),
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value == null || !RegExp(r"^\d{9}$").hasMatch(value)) {
              return "Ingrese un teléfono válido";
            }
            return null;
          },
        ),
        Row(
          children: [
            Checkbox(
              value: hasChildren,
              onChanged: (value) => setState(() => hasChildren = value!),
            ),
            Text("¿Tiene hijos?",
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodyLarge?.color)),
          ],
        ),
        if (hasChildren)
          Column(
            children: List.generate(3, (index) {
              return TextFormField(
                controller: childrenAgeControllers[index],
                decoration: InputDecoration(
                    labelText: "Edad del hijo ${index + 1}",
                    labelStyle: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge?.color)),
                validator: (value) {
                  if (value != null &&
                      value.isNotEmpty &&
                      !RegExp(r'^\d{1,3}$').hasMatch(value)) {
                    return "Ingrese una edad válida";
                  }
                  return null;
                },
              );
            }),
          ),
      ],
    );
  }

  // Formulario para la posición derecha
  Widget buildRightForm() {
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            if (pickedDate != null) {
              setState(() {
                birthDate = pickedDate;
              });
            }
          },
          child: AbsorbPointer(
            child: TextFormField(
              controller: TextEditingController(
                text: birthDate == null
                    ? ""
                    : DateFormat('dd/MM/yyyy').format(birthDate!),
              ),
              decoration: InputDecoration(
                labelText: "Fecha de nacimiento",
                hintText: birthDate == null
                    ? "Seleccione una fecha"
                    : DateFormat('dd/MM/yyyy').format(birthDate!),
                filled: true,
                fillColor: Theme.of(context).scaffoldBackgroundColor,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).textTheme.bodyLarge?.color ??
                        Colors.white,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).textTheme.bodyLarge?.color ??
                        Colors.white,
                  ),
                ),
              ),
              style: TextStyle(
                  color: Theme.of(context).textTheme.bodyLarge?.color ??
                      Colors.white),
              readOnly: true,
              validator: (value) {
                if (birthDate == null) {
                  return "Seleccione una fecha";
                }
                return null;
              },
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        DropdownButtonFormField<String>(
          value: selectedCity,
          decoration: InputDecoration(
            labelText: "Ciudad en Andalucía",
            labelStyle:
                TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color),
            filled: true,
            fillColor: Theme.of(context).scaffoldBackgroundColor,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).textTheme.bodyLarge?.color ??
                      Colors.white),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).textTheme.bodyLarge?.color ??
                      Colors.white),
            ),
          ),
          items: [
            "Sevilla",
            "Córdoba",
            "Granada",
            "Málaga",
            "Almería",
            "Jaén",
            "Huelva",
            "Cádiz"
          ]
              .map((city) => DropdownMenuItem(
                    value: city,
                    child: Text(city),
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              selectedCity = value;
            });
          },
          validator: (value) {
            if (value == null) {
              return "Seleccione una ciudad";
            }
            return null;
          },
        ),
        Column(
          children: hobbies.entries.map((hobby) {
            return Row(
              children: [
                Checkbox(
                  value: hobby.value,
                  onChanged: (value) {
                    setState(() {
                      hobbies[hobby.key] = value!;
                    });
                  },
                ),
                Text(hobby.key,
                    style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge?.color)),
              ],
            );
          }).toList(),
        ),
        Column(
          children: [
            RadioListTile<String>(
              title: Text("Hombre",
                  style: TextStyle(
                      color: Theme.of(context).textTheme.bodyLarge?.color)),
              value: "Hombre",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value;
                });
              },
            ),
            RadioListTile<String>(
              title: Text("Mujer",
                  style: TextStyle(
                      color: Theme.of(context).textTheme.bodyLarge?.color)),
              value: "Mujer",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value;
                });
              },
            ),
            RadioListTile<String>(
              title: Text("Otro",
                  style: TextStyle(
                      color: Theme.of(context).textTheme.bodyLarge?.color)),
              value: "Otro",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}