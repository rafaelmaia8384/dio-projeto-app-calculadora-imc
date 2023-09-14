import 'package:flutter/material.dart';

import '../models/model_imc.dart';

class WidgetIMCLayout extends StatelessWidget {
  const WidgetIMCLayout({
    super.key,
    required this.imc,
  });
  final ModelIMC imc;
  // void _getResult() async {
  //   await Future.delayed(const Duration(seconds: 2));
  //   setState(() {
  //     _imcResult = widget.imc.getIMC();
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   _getResult();
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, top: 12, right: 12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('IMC: ${imc.getIMC()}'),
              const SizedBox(
                height: 4,
              ),
              Text(
                imc.getIMCResult(),
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          // child: _imcResult == null
          //     ? const SizedBox(
          //         width: double.maxFinite,
          //         height: 38,
          //         child: Center(
          //           child: SizedBox(
          //             width: 20,
          //             height: 20,
          //             child: CircularProgressIndicator(
          //               strokeWidth: 1.5,
          //             ),
          //           ),
          //         ),
          //       )
          //     : Column(
          //         children: [
          //           Text('IMC: $_imcResult'),
          //           const SizedBox(
          //             height: 4,
          //           ),
          //           Text(
          //             widget.imc.getIMCResult(),
          //             style: const TextStyle(
          //               color: Colors.grey,
          //             ),
          //           ),
          //         ],
          //       ),
        ),
      ),
    );
  }
}
