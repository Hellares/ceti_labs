import 'package:ceti_labs/src/widgets/custom_textfieldv4.dart';
import 'package:flutter/material.dart';

class ExpandableComponentCard extends StatefulWidget {
  const ExpandableComponentCard({Key? key}) : super(key: key);

  @override
  ExpandableComponentCardState createState() => ExpandableComponentCardState();
}

class ExpandableComponentCardState extends State<ExpandableComponentCard> {
  bool _showComponent2 = false;
  bool _showComponent3 = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8, bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        //borderRadius: BorderRadius.circular(12),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            //spreadRadius: 1,
            blurRadius: 4,
            //offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFieldV4(
              label: 'Componente 1',
              sizeFont: 12,
              colorLabel: Colors.grey[600],
              onChanged: (txt) {},
            ),
            const SizedBox(height: 12),
            _buildExpandableSection(
              title: 'Añadir Componente',
              isExpanded: _showComponent2,
              onExpand: () {
                setState(() {
                  _showComponent2 = !_showComponent2;
                  if (!_showComponent2) {
                    _showComponent3 = false;
                  }
                });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFieldV4(
                    label: 'Componente 2',
                    sizeFont: 12,
                    colorLabel: Colors.grey[600],
                    onChanged: (txt) {},
                  ),
                  if (_showComponent2) ...[
                    const SizedBox(height: 12),
                    _buildExpandableSection(
                      title: 'Añadir Componente',
                      isExpanded: _showComponent3,
                      onExpand: () => setState(() => _showComponent3 = !_showComponent3),
                      child: CustomTextFieldV4(
                        label: 'Componente 3',
                        sizeFont: 12,
                        colorLabel: Colors.grey[600],
                        onChanged: (txt) {},
                      ),
                    ),
                  ],
                ],
              ),
            ),            
          ],
        ),
      ),
    );
  }

  Widget _buildExpandableSection({
    required String title,
    required bool isExpanded,
    required VoidCallback onExpand,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onExpand,
          child: Row(
            children: [
              Icon(
                isExpanded ? Icons.remove : Icons.add,
                size: 20,
                color: Color.fromARGB(255, 161, 161, 161),
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  color: Color.fromARGB(255, 161, 161, 161),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        if (isExpanded) ...[
          const SizedBox(height: 12),
          child,
        ],
      ],
    );
  }
}