// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfViewerScreen extends StatefulWidget {
  final String url;

  const PdfViewerScreen({Key? key, required this.url}) : super(key: key);

  @override
  State<PdfViewerScreen> createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  int totalPages = 0;
  bool isLoading = true;

  @override
  void initState() {
    print(widget.url);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Viewer'),
      ),
      body: Stack(
        children: <Widget>[
          PDFView(
            filePath: widget.url,
            autoSpacing: true,
            enableSwipe: true,
            pageSnap: true,
            swipeHorizontal: true,
            onError: (error) {
              print(error.toString());
            },
            onRender: (_pages) {
              setState(() {
                totalPages = _pages!;
                isLoading = false;
              });
            },
            onViewCreated: (PDFViewController vc) {},
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : const Offstage(),
        ],
      ),
    );
  }
}
