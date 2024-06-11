import 'package:flutter/material.dart';

class TelaMatch extends StatefulWidget {
  const TelaMatch({super.key});

  @override
  State<TelaMatch> createState() => _TelaMatchState();
}

class _TelaMatchState extends State<TelaMatch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seus Matches'),
      ),
      body: Container(      
        child: Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(elevation: 2, backgroundColor: Colors.red),            
              onPressed: () { },
              child: Row(
                children: [
                  Image.asset('assets/images/bmw.jpg', height: 100, width: 100),
                  Text('    Button with Image 1', style: TextStyle(fontSize: 20, color: Colors.black), ),
                ],
              ),
            ),
            SizedBox(height: 10), // add some space between buttons
            ElevatedButton(
              style: ElevatedButton.styleFrom(elevation: 2),
              onPressed: () { },
              child: Row(
                children: [
                  Image.asset('assets/images/imat.jpeg', height: 100, width: 100),
                  Text('    Button with Image 2', style: TextStyle(fontSize: 20, color: Colors.black), ),
                ],
              ),
            ),
            SizedBox(height: 10), // add some space between buttons
            ElevatedButton(
              style: ElevatedButton.styleFrom(elevation: 2),
              onPressed: () { },
              child: Row(
                children: [
                  Image.asset('assets/images/imat.jpeg', height: 100, width: 100),
                  Text('    Button with Image 3', style: TextStyle(fontSize: 20, color: Colors.black), ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}