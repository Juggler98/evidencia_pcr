import 'package:evidencia_pcr/screens/generator_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 120,
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
              onTap: () {
                Navigator.of(context).pop();
                //Navigator.of(context).pushNamed(ContactUsScreen.routeName);
              },
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
