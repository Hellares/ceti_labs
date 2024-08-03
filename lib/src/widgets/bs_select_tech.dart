import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BSSelectTech extends StatefulWidget {
  const BSSelectTech({super.key});

  @override
  State<BSSelectTech> createState() => _BSSelectTechState();
}

class _BSSelectTechState extends State<BSSelectTech> {
String selectedTech = 'Asingnar Tecnico';
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Row(
          children: [
            SvgPicture.asset('assets/icons/tecnico3.svg', width: 25, height: 25),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12.0),
                //height: 45,
                decoration: BoxDecoration(
                    
                    border: Border.all(
                      width: 1,
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(15.0)),
                child: Center(
                  child: Text(
                    selectedTech,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Araboto Normal 400',
                      color: Colors.teal
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        _showBottomSheetSelectTech(context);
      },
    );
  }
  void _showBottomSheetSelectTech(BuildContext context) {
  List<String> devices = ['LUIS TORRES', 'DIANA ROMERO', 'ARMIN LOZANO'];
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10),
            
            Text(
              selectedTech,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: devices.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(devices[index]),
                    onTap: () {
                      setState(() {
                        selectedTech = devices[index];
                      });
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}
  
  
  
}