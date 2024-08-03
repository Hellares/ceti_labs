import 'package:flutter/material.dart';

class ComponentSelectorWidget extends StatefulWidget {
  @override
  ComponentSelectorWidgetState createState() => ComponentSelectorWidgetState();
}

class ComponentSelectorWidgetState extends State<ComponentSelectorWidget> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _components = [
    'Memoria RAM',
    'Procesador',
    'Motherboard',
    'Tarjeta de video',
    'Disco duro',
    'Fuente de poder',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: _components.map((component) {
            return ElevatedButton(
              onPressed: () {
                setState(() {
                  _controller.text = component;
                });
              },
              child: Text(component),
            );
          }).toList(),
        ),
        SizedBox(height: 20),
        TextFormField(
          controller: _controller,
          decoration: InputDecoration(
            labelText: 'Componente seleccionado',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}