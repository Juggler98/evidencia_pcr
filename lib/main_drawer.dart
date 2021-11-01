import 'dart:io';

import 'package:evidencia_pcr/screens/generator_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'Application.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 110,
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              alignment: Alignment.bottomLeft,
              color: Colors.brown,
              child: Text(
                'Evidencia PCR testov',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 15),
            ListTile(
              leading: Icon(
                Icons.add_box_outlined,
                color: Colors.black54,
              ),
              title: Text('Generátor'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => GeneratorScreen(),
                  ),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.upload_outlined,
                color: Colors.black54,
              ),
              title: Text('Načítaj zo súboru'),
              onTap: () async {
                try {
                  final result = await FilePicker.platform.pickFiles();
                  if (result != null) {
                    File file = File(result.files.single.path);
                    final lines = await file.readAsLines();
                    if (Application().loadFromFile(lines)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Dáta boli načítané'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Nastala chyba pri načítaní'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Nastala chyba pri načítaní'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.delete_forever_outlined,
                color: Colors.black54,
              ),
              title: Text('Vymaž všetko'),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (ctx) {
                      return AlertDialog(
                        title: Text('Určite?'),
                        content: Text('Určite chceš vymazať všetky dáta?'),
                        actions: [
                          TextButton(
                            child: Text("Vymazať"),
                            onPressed: () {
                              Application().removeAllData();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Dáta boli vymazané'),
                                  backgroundColor: Colors.green,
                                ),
                              );
                              Navigator.of(context).pop(true);
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: Text("Zrušiť"),
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            },
                          ),
                        ],
                      );
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
