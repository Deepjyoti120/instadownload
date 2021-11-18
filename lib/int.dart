import 'dart:async';

import 'package:flutter/material.dart' hide Intent;
import 'package:receive_intent/receive_intent.dart';

class Initttt extends StatefulWidget {
  const Initttt({Key? key}) : super(key: key);

  @override
  _InittttState createState() => _InittttState();
}

class _InittttState extends State<Initttt> {
  late Intent _initialIntent;
  final TextEditingController ccc = TextEditingController();

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final receivedIntent = await ReceiveIntent.getInitialIntent();

    if (!mounted) return;

    setState(() {
      _initialIntent = receivedIntent!;
      ccc.text = _initialIntent.toString();
    });
  }

  // Widget _buildFromIntent(String label, Intent intent) {
  //   return Center(
  //     child: Column(
  //       children: [Text("extras: ${_initialIntent.extra}")],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(_initialIntent.extra.toString()),
              TextField(
                controller: ccc,
              )
              // _buildFromIntent("INITIAL", _initialIntent),
              // StreamBuilder<Intent?>(
              //   stream: ReceiveIntent.receivedIntentStream,
              //   builder: (context, snapshot) =>
              //       _buildFromIntent("STREAMED", snapshot.data!),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
