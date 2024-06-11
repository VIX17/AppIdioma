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
      body: const Placeholder(),
    );
  }
}