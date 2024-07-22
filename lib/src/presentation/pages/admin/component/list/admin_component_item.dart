import 'package:ceti_labs/src/domain/models/component_device_response.dart';
import 'package:flutter/material.dart';

class AdminComponentItem extends StatelessWidget {
  final String? deviceName;
  final List<Component> componentes;
  const AdminComponentItem(
      {required this.deviceName, required this.componentes, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 15, top: 20),
          child: Text(
            'COMPONENTES :  $deviceName',
            style: TextStyle(
                fontFamily: 'Araboto Normal 400',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 3, 101, 182)),
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: componentes.length,
            itemBuilder: (context, index) {
              final componente = componentes[index];
              return SizedBox(
                height: 40,
                child: ListTile(
                  title: Text(
                    componente.name,
                    style: TextStyle(
                      fontFamily: 'Araboto Normal 400',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 70, 68, 68)
                    ),
                  ),
                  leading: Icon(Icons.linear_scale_rounded, size: 20, color: Color.fromARGB(255, 3, 101, 182),),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
