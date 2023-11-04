import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:so/so.dart';
import 'package:so_flutter/so_flutter.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFReport extends StatefulScreen {
  final Client client;
  final Map<String, dynamic>? parameterMap;
  final String reportClassName;

  PDFReport(
      {this.parameterMap, required this.client, required this.reportClassName});

  @override
  Scaffold build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Report Test"),
        ),
        body: FutureBuilder<(Uint8List?, String?, String?)>(
          future: client.report('', parameterMap),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              log(snapshot.error.toString());
              return const Text("An error occured");
            } else if (snapshot.hasData) {
              if (snapshot.data!.$2!.contains("pdf")) {
                Uint8List? pdfBytes = snapshot.data!.$1;
                if (pdfBytes == null) {
                  return const Text('No data to display');
                } else {
                  return SfPdfViewer.memory(pdfBytes);
                }
              }
            }
            return const Text('No Data To Display');
          },
        ));
  }
} // For accessing the file system
