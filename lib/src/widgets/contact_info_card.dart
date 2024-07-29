import 'package:flutter/material.dart';

class ContactInfoContainer extends StatelessWidget {
  const ContactInfoContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8, bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            //spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildInfoRow(Icons.location_on_outlined, 'Peru'),
          _buildInfoRow(Icons.email_outlined, 'susyzuyx@gmail.com'),
          _buildInfoRow(
            Icons.phone,
            'WhatsApp',
            iconColor: Colors.green,
            isLast: false,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text, {Color? iconColor, bool isLast = false}) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 35,
              child: Icon(icon, color: iconColor ?? Colors.grey[600], size: 24),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: TextStyle(fontSize: 12, color: Colors.black87),
                  ),
                  if (!isLast)
                    Padding(
                      padding: EdgeInsets.only(top: 3),
                      child: Divider(height: 1, color: Colors.grey[300]),
                    ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: isLast ? 0 : 12),
      ],
    );
  }
}