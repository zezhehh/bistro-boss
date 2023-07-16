import 'package:flutter/material.dart';

class ProposalGenerator extends StatelessWidget {
  const ProposalGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        AppBar(),
        Center(
            child: Column(
          children: [Text("Create a proposal for dinner")],
        )),
      ],
    ));
  }
}
